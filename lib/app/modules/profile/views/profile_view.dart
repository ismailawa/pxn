import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100.withOpacity(0.3),
      body: SingleChildScrollView(
        child: GetBuilder<ProfileController>(
          builder: (newController) => profileController.user != null
              ? Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(profileController.user['fullname'],
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Text(profileController.user['phone'],
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                            left: 30, right: 30, top: 20, bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            ProfileBtn(
                                onTap: () => Get.toNamed("/edit-profile"),
                                label: "Personal info"),
                            Divider(
                              color: Colors.blue.shade100.withOpacity(0.3),
                              thickness: 2,
                            ),
                            // ProfileBtn(
                            //   icon: Icons.settings,
                            //   label: "Settings",
                            // ),
                            // Divider(
                            //   color: Colors.blue.shade100.withOpacity(0.3),
                            //   thickness: 2,
                            // ),
                            ProfileBtn(
                              icon: Icons.subscriptions,
                              label: "Shipping Address",
                              onTap: () => Get.toNamed("/add-shipping-address"),
                            ),
                            Divider(
                              color: Colors.blue.shade100.withOpacity(0.3),
                              thickness: 2,
                            ),
                            Divider(
                              color: Colors.blue.shade100.withOpacity(0.3),
                              thickness: 2,
                            ),
                            ProfileBtn(
                              icon: Icons.logout,
                              label: "Logout",
                              onTap: () => profileController.logout(),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Center(
                      child: Column(
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        size: 100,
                        color: Colors.redAccent,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "You are not login, please login",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.redAccent,
                          onPressed: () => Get.toNamed("/login"),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )),
                ),
        ),
      ),
    );
  }
}

class ProfileBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onTap;

  const ProfileBtn({
    Key key,
    this.icon = Icons.edit_rounded,
    this.label = "Edit Profile",
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              Text(label,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
