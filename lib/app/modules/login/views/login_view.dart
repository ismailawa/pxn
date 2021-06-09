import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/components/custom_btn.dart';
import 'package:pxn_mobile/app/modules/components/custom_input.dart';
import 'package:pxn_mobile/app/modules/components/logo.dart';
import 'package:pxn_mobile/utils/constants.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: controller.loginFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Logo(),
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
                                "LOGIN",
                                style: kLargeTitleStyle,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8, bottom: 16),
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
                            validator: controller.validatePassword,
                            icon: Icons.person,
                            hint: "username",
                            controller: controller.username,
                          ),
                          CustomInput(
                            validator: controller.validatePassword,
                            icon: Icons.lock,
                            hint: "Password",
                            controller: controller.password,
                          ),
                          CustomBtn(
                            label: "Login",
                            onPress: () {
                              controller.login();
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 16),
                            child: InkWell(
                              onTap: () {
                                Get.toNamed('/registration');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account?",
                                    style: kSubtitleStyle,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Register",
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
