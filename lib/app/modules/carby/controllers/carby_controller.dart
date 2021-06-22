import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/places.dart';

class CarbyController extends GetxController {
  TextEditingController destinationController = TextEditingController();
  TextEditingController pickupController = TextEditingController();
  RxDouble percent = RxDouble(0.0);

  static const ACCEPTED = 'accepted';
  static const CANCELLED = 'cancelled';
  static const PENDING = 'pending';
  static const EXPIRED = 'expired';
  static const PICKUP_MARKER_ID = 'pickup';
  static const LOCATION_MARKER_ID = 'location';
  static const DRIVER_AT_LOCATION_NOTIFICATION = 'DRIVER_AT_LOCATION';
  static const REQUEST_ACCEPTED_NOTIFICATION = 'REQUEST_ACCEPTED';
  static const TRIP_STARTED_NOTIFICATION = 'TRIP_STARTED';

  Rx<LatLng> center = Rx<LatLng>(null);
  Rx<Position> position = Rx<Position>(null);
  Rx<LatLng> lastPosition = Rx<LatLng>(LatLng(0, 0));
  GetStorage storage = GetStorage();

  GoogleMapController _mapController;

  GoogleMapController get mapController => _mapController;

  //   taxi pin
  BitmapDescriptor carPin;

  //   location pin
  BitmapDescriptor locationPin;

  // Rx<LatLng> get getcenter => center;

  // LatLng get lastPosition => _lastPosition;

  // Set<Marker> get markers => _markers;

  // Set<Polyline> get poly => _poly;

  LatLng pickupCoordinates;
  LatLng destinationCoordinates;
  double ridePrice = 0;
  String notificationType = "";

  Set<Marker> _markers = {};
  // //  this polys will be displayed on the map
  // Set<Polyline> _poly = {};
  // // this polys temporarely store the polys to destination
  // Set<Polyline> _routeToDestinationPolys = {};
  // // this polys temporarely store the polys to driver
  // Set<Polyline> _routeToDriverpoly = {};

  @override
  void onInit() {
    super.onInit();
    _getCurrentUserLocation();
    Geolocator.getPositionStream().listen(_updatePosition);
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<Rx<Position>> _getCurrentUserLocation() async {
    final mposition = await Geolocator.getCurrentPosition();
    position(mposition);
    List<Placemark> placemark = await placemarkFromCoordinates(
        position.value.latitude, position.value.longitude);
    if (storage.read("country") == null) {
      String country = placemark[0].isoCountryCode.toLowerCase();
      await storage.write("country", country);
    }
    // String country = placemark[0].isoCountryCode.toLowerCase();
    // print(country);
    center(LatLng(position.value.latitude, position.value.longitude));

    return position;
  }

  onCreate(GoogleMapController controller) {
    _mapController = controller;
  }

  // ANCHOR: MAPS & LOCATION METHODS
  _updatePosition(Position newPosition) {
    position(newPosition);
  }

  setLastPosition(LatLng position) {
    lastPosition(position);
  }

  List _decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List.empty();
    int index = 0;
    int len = poly.length;
    int c = 0;
// repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      // for decoding value of one attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      /* if value is negetive then bitwise not the value */
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

/*adding to previous value as done in encoding */
    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    print(lList.toString());

    return lList;
  }

  // ANCHOR: MARKERS AND POLYS
  _addLocationMarker(LatLng position, String distance) {
    _markers.add(Marker(
        markerId: MarkerId(LOCATION_MARKER_ID),
        position: position,
        anchor: Offset(0, 0.85),
        infoWindow:
            InfoWindow(title: destinationController.text, snippet: distance),
        icon: locationPin));
  }

  addPickupMarker(LatLng position) {
    if (pickupCoordinates == null) {
      pickupCoordinates = position;
    }
    _markers.add(Marker(
        markerId: MarkerId(PICKUP_MARKER_ID),
        position: position,
        anchor: Offset(0, 0.85),
        zIndex: 3,
        infoWindow: InfoWindow(title: "Pickup", snippet: "location"),
        icon: locationPin));
  }

  onPickupFieldTap(BuildContext context) async {
    final country = storage.read("country");
    try {
      Prediction p = await PlacesAutocomplete.show(
          offset: 0,
          radius: 100000,
          strictbounds: false,
          logo: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Icon(Icons.accessibility_sharp),
            ),
          ),
          language: "en",
          context: context,
          apiKey: "AIzaSyA6PlDih_oV6hhAyq15oAUz5QNF1GgcUKA",
          mode: Mode.overlay, // Mode.fullscreen
          components: [Component(Component.country, country)],
          // types: ["(cities)"],
          hint: "Search City",
          startText: "");

      print(country);
    } catch (e) {}
  }

  @override
  void onClose() {
    destinationController.dispose();
    pickupController.dispose();
  }
}
