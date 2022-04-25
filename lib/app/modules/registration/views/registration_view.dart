import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/components/custom_btn.dart';
import 'package:pxn_mobile/app/modules/components/custom_input.dart';
import 'package:pxn_mobile/app/modules/components/logo.dart';
import 'package:pxn_mobile/utils/constants.dart';

import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.registrationFormkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
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
                                "Registration",
                                style: kLargeTitleStyle,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8, bottom: 0),
                            child: Row(
                              children: [
                                Text(
                                  "Start your financial journey",
                                  style: kSubtitleStyle,
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          CustomInput(
                            controller: controller.fullNameCtrl,
                            validator: controller.validateFirstName,
                            icon: Icons.person,
                            hint: "Full Name",
                          ),
                          CustomInput(
                            controller: controller.phoneCtrl,
                            validator: controller.validatePhone,
                            icon: Icons.phone,
                            hint: "Phone",
                          ),
                          CustomInput(
                            controller: controller.emailCtrl,
                            validator: controller.validateEmail,
                            icon: Icons.email,
                            hint: "Email",
                          ),
                          CustomInput(
                            controller: controller.passwordCtrl,
                            validator: controller.validatePassword,
                            isPassword: true,
                            icon: Icons.lock,
                            hint: "Password",
                          ),
                          CustomBtn(
                            label: "Register",
                            onPress: () {
                              controller.register();
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 10),
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account?",
                                    style: kSubtitleStyle,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Login.",
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
