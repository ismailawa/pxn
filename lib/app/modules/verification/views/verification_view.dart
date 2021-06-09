import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/components/custom_btn.dart';
import 'package:pxn_mobile/app/modules/components/custom_input.dart';
import 'package:pxn_mobile/app/modules/components/logo.dart';
import 'package:pxn_mobile/utils/constants.dart';

import '../controllers/verification_controller.dart';

class VerificationView extends GetView<VerificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.verificationFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Logo(
                        size: 80,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20,
                              offset: Offset(0, 10))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Verification",
                                style: kLargeTitleStyle,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8, bottom: 0),
                            child: Row(
                              children: [
                                Text(
                                  "Verify your email address",
                                  style: kSubtitleStyle,
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          CustomInput(
                            controller: controller.tokenCtrl,
                            inputType: TextInputType.number,
                            validator: controller.validateToken,
                            icon: Icons.security,
                            hint: "Token",
                          ),
                          CustomBtn(
                            label: "Verify",
                            onPress: () {
                              controller.verifyToken();
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 10),
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Didnt get verification email?",
                                    style: kSubtitleStyle,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Resend token",
                                    style: kSubtitleStyle2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
