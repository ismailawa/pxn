import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends GetView {
  final LatLng center;
  final Function(GoogleMapController) onCreate;
  final Set<Marker> markers;

  MapView({this.center, this.onCreate, this.markers});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          initialCameraPosition: CameraPosition(target: center, zoom: 15),
          onMapCreated: onCreate,
          myLocationEnabled: true,
          mapType: MapType.normal,
          compassEnabled: true,
          rotateGesturesEnabled: true,
          // markers: markers,
          // onCameraMove: appState.onCameraMove,
          // polylines: controller.poly,
        ),
//              Positioned(
//                bottom: 60,
//                right: 0,
//                left: 0,
//                height: 60,
//                child: Visibility(
//                  visible: appState.routeModel != null,
//                  child: Padding(
//                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
//                    child: Container(
//                      color: Colors.white,
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        children: <Widget>[
//                          FlatButton.icon(
//                              onPressed: null,
//                              icon: Icon(Icons.timer),
//                              label: Text(
//                                  appState.routeModel?.timeNeeded?.text ?? "")),
//                          FlatButton.icon(
//                              onPressed: null,
//                              icon: Icon(Icons.flag),
//                              label: Text(
//                                  appState.routeModel?.distance?.text ?? "")),
//                          FlatButton(
//                              onPressed: () {},
//                              child: CustomText(
//                                text:
//                                    "\$${appState.routeModel?.distance?.value == null ? 0 : appState.routeModel?.distance?.value / 500}" ??
//                                        "",
//                                color: Colors.deepOrange,
//                              ))
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//              ),
      ],
    );
  }

  // Future<Null> displayPrediction(Prediction p) async {
  //   if (p != null) {
  //     PlacesDetailsResponse detail =
  //         await places.getDetailsByPlaceId(p.placeId);

  //     var placeId = p.placeId;
  //     double lat = detail.result.geometry.location.lat;
  //     double lng = detail.result.geometry.location.lng;

  //     var address = await Geocoder.local.findAddressesFromQuery(p.description);

  //     print(lat);
  //     print(lng);
  //   }
  // }
}
