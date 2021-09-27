import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/components/custom_btn.dart';
import 'package:pxn_mobile/app/modules/components/custom_dropdown.dart';
import 'package:pxn_mobile/app/modules/components/custom_input.dart';
import 'package:pxn_mobile/utils/constants.dart';

import '../controllers/cable_controller.dart';

class CableView extends GetView<CableController> {
  var ctrl = Get.put(CableController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.9,
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
                      child: Form(
                        key: controller.cableFormState,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cable tv",
                              style: kLargeTitleStyle,
                            ),
                            Divider(
                              color: Colors.black38,
                              endIndent:
                                  MediaQuery.of(context).size.width * 0.6,
                            )
                          ],
                        ),
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
                              controller.selectProvider(value);

                              // controller.getDataBundles(
                              //     (value as ProviderModel).shortname);
                            },
                          ),
                          controller.selectProvider.value == null
                              ? SizedBox.shrink()
                              : Column(
                                  children: [
                                    CustomInput(
                                      icon: Icons.account_box,
                                      hint: "Enter Account Number",
                                      inputType: TextInputType.number,
                                      controller: controller.accountCtrl,
                                    ),
                                    CustomBtn(
                                      label: "Verify",
                                      onPress: () {
                                        controller.verifyClientAccount();
                                      },
                                    ),
                                  ],
                                ),
                          controller.verifiedAccount.value == null
                              ? SizedBox.shrink()
                              : Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Container(
                                          height: 100,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                              color: Colors.black54,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${controller.verifiedAccount.value["name"]}",
                                              ),
                                              Text(
                                                "${controller.verifiedAccount.value["outstandingBalance"]}",
                                              ),
                                              Text(
                                                "${controller.verifiedAccount.value["dueDate"]}",
                                              ),
                                              Text(
                                                "${controller.verifiedAccount.value["rawOutput"]["accountStatus"]}",
                                              ),
                                              Text(
                                                "${controller.verifiedAccount.value["rawOutput"]["customerType"]}",
                                              ),
                                            ],
                                          )),
                                    ),
                                    CustomBtn(
                                      label: "Buy",
                                      onPress: () {},
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
