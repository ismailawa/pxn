import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/components/custom_btn.dart';
import 'package:pxn_mobile/app/modules/components/custom_input.dart';
import 'package:pxn_mobile/app/modules/transfers/controllers/transfers_controller.dart';
import 'package:pxn_mobile/utils/constants.dart';

class WalletToWalletView extends GetView {
  TransfersController controller = Get.find<TransfersController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: SingleChildScrollView(
          child: Form(
            // key: ctrl.airTimeFormState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Wallet to wallet",
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
                      CustomInput(
                        controller: controller.usernameCtrl,
                        icon: Icons.person,
                        hint: "Enter beneficiary username",
                      ),
                      CustomBtn(
                        label: "Verify",
                        onPress: () {
                          controller.verifyUsername();
                        },
                      ),
                      controller.verifiedUser.value == null
                          ? SizedBox.shrink()
                          : Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    "${controller.verifiedUser.value['wallet_holder']}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: pxnPrimaryColor,
                                    ),
                                  ),
                                ),
                                CustomInput(
                                  controller: controller.amountCtrl,
                                  icon: Icons.money,
                                  hint: "Enter Amount",
                                ),
                                CustomBtn(
                                  label: "Transfer",
                                  onPress: () {
                                    controller.transferFund();
                                  },
                                ),
                              ],
                            )
                    ],
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
