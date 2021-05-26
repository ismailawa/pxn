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
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Row(
                  children: [
                    Logo(
                      size: 40,
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
                          icon: Icons.person,
                          hint: "First Name",
                        ),
                        CustomInput(
                          icon: Icons.person,
                          hint: "Last Name",
                        ),
                        CustomInput(
                          icon: Icons.person,
                          hint: "Username",
                        ),
                        CustomInput(
                          icon: Icons.phone,
                          hint: "Phone",
                        ),
                        CustomInput(
                          icon: Icons.email,
                          hint: "Email",
                        ),
                        CustomInput(
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
                              Get.toNamed('/login');
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
                                  "Login",
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
    );
  }
}
