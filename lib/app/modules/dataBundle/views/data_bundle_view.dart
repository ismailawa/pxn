import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/components/custom_btn.dart';
import 'package:pxn_mobile/app/modules/components/custom_dropdown.dart';
import 'package:pxn_mobile/app/modules/components/custom_input.dart';
import 'package:pxn_mobile/app/modules/dataBundle/provider_model.dart';
import 'package:pxn_mobile/utils/constants.dart';

import '../controllers/data_bundle_controller.dart';

// ignore: must_be_immutable
class DataBundleView extends GetView<DataBundleController> {
  var ctrl = Get.put(DataBundleController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: ctrl.providers.value.length < 1
            ? Container(
                child: Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: pxnPrimaryColor,
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
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
                            displayValue: "shortname",
                            billers: controller.providers.value,
                            selectedBiller: controller.selectProvider.value,
                            onChanged: (value) {
                              controller.bundles([]);
                              controller.selectProvider(value);

                              controller.getDataBundles(
                                  (value as ProviderModel).shortname);
                            },
                          ),
                          controller.bundles.value.length < 1
                              ? SizedBox.shrink()
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CustomDropDown(
                                      hint: "Select Data Bundle",
                                      displayValue: "name",
                                      billers: controller.bundles.value,
                                      onChanged: (value) {
                                        controller.selectedBundle(value);
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Container(
                                        height: 50,
                                        padding: EdgeInsets.only(left: 15),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black38,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.money,
                                              color: pxnSecondaryColor,
                                            ),
                                            controller.selectedBundle.value ==
                                                    null
                                                ? Text("")
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 12,
                                                    ),
                                                    child: Text(
                                                      "${controller.selectedBundle.value.price}",
                                                      style: TextStyle(
                                                        color: Colors.black87,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  )
                                          ],
                                        ),
                                      ),
                                    ),
                                    CustomInput(
                                      controller: controller.phoneNumberCtrl,
                                      icon: Icons.phone,
                                      hint: "Enter Phone Number",
                                    ),
                                    CustomBtn(
                                      label: "Buy",
                                      onPress: () {
                                        controller.purchaseDataBundles();
                                      },
                                    ),
                                  ],
                                ),
                        ],
                      )),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
