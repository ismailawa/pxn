import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/components/custom_btn.dart';
import 'package:pxn_mobile/app/modules/components/custom_dropdown.dart';
import 'package:pxn_mobile/app/modules/components/custom_input.dart';
import 'package:pxn_mobile/utils/constants.dart';

import '../controllers/data_bundle_controller.dart';

// ignore: must_be_immutable
class DataBundleView extends GetView<DataBundleController> {
  var _ = Get.put(DataBundleController());
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
                    "Data Bundle",
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
                  CustomDropDown(
                    hint: "Select Provider",
                    billers: controller.providers.value,
                    onChanged: (value) {},
                  ),
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
