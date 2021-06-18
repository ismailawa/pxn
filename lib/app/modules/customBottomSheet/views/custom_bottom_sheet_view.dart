import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/components/custom_btn.dart';
import 'package:pxn_mobile/app/modules/components/custom_input.dart';
import 'package:pxn_mobile/utils/constants.dart';

import '../controllers/custom_bottom_sheet_controller.dart';

class CustomBottomSheetView extends GetView<CustomBottomSheetController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Airtime",
                    style: kLargeTitleStyle,
                  ),
                  Divider(
                    color: Colors.black38,
                    endIndent: MediaQuery.of(context).size.width * 0.6,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                  child: Column(
                children: [
                  CustomDropDown(),
                  CustomInput(
                    icon: Icons.phone,
                    hint: "Enter Phone Number",
                  ),
                  CustomInput(
                    icon: Icons.money,
                    hint: "Enter Amount",
                  ),
                  CustomBtn(
                    label: "Buy",
                    onPress: () {},
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: DropdownButtonFormField(
        onChanged: (value) {},
        selectedItemBuilder: (context) => [
          Text("data"),
        ],
        decoration: InputDecoration(
          hintText: "Select Vendor",
          hintStyle: kSearchPlaceholderStyle,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(
                color: Color(0xFF1D83AE),
                width: 2,
              )),
          prefixIcon: Icon(
            Icons.airline_seat_flat,
            color: Color(0xFF1D83AE),
          ),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        items: [
          DropdownMenuItem(
            child: Text("MTM"),
          ),
          DropdownMenuItem(
            child: Text("Airtel"),
          ),
          DropdownMenuItem(
            child: Text("GLO"),
          ),
          DropdownMenuItem(
            child: Text("9Mobile"),
          ),
        ],
      ),
    );
  }
}
