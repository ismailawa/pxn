import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/modules/carby/views/carby_view.dart';
import 'package:pxn_mobile/utils/constants.dart';

class PickupSelectionView extends GetView {
  final TextEditingController controller;
  final Function(BuildContext) onTap;
  final ScrollController mController;

  PickupSelectionView({this.controller, this.onTap, this.mController});

  @override
  Widget build(BuildContext context) {
    GetStorage storage = GetStorage();
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.3),
                  offset: Offset(3, -10),
                  blurRadius: 20)
            ]),
        child: ListView(
          padding: EdgeInsets.zero,
          controller: mController,
          children: [
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 4,
              color: pxnSecondaryColor,
              indent: 150,
              endIndent: 150,
            ),
            SearchBar()
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: TextFormField(
            //     controller: controller,
            //     onTap: () async {
            //       final country = storage.read("country");
            //       Prediction p = await PlacesAutocomplete.show(
            //           offset: 0,
            //           radius: 100000,
            //           strictbounds: false,
            //           logo: Container(
            //             height: 50,
            //             width: MediaQuery.of(context).size.width,
            //             child: Center(
            //               child: Icon(Icons.accessibility_sharp),
            //             ),
            //           ),
            //           language: "en",
            //           context: context,
            //           apiKey: "AIzaSyA6PlDih_oV6hhAyq15oAUz5QNF1GgcUKA",
            //           mode: Mode.overlay, // Mode.fullscreen
            //           components: [Component(Component.country, country)],
            //           types: ["(cities)"],
            //           hint: "Search City",
            //           startText: "");
            //     },
            //     textInputAction: TextInputAction.go,
            //     cursorColor: Color(0xFF1D83AE),
            //     decoration: InputDecoration(
            //       hintText: "Where to?",
            //       hintStyle: kSearchPlaceholderStyle,
            //       prefixIcon: Icon(
            //         Icons.location_on,
            //         color: Color(0xFF1D83AE),
            //         size: 30,
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(40),
            //           borderSide: BorderSide(
            //             color: Color(0xFF1D83AE),
            //             width: 2,
            //           )),
            //       isDense: true,
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(40),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ));
  }
}

class TopLine extends StatelessWidget {
  const TopLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 6,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.blue.shade200.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
