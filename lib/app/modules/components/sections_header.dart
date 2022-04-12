import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/dashboard/controllers/dashboard_controller.dart';

class HeaderSection extends StatelessWidget {
  final dashboardController =
      Get.put<DashboardController>(DashboardController());
  final VoidCallback onTap;

  HeaderSection({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
          Spacer(),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.redAccent),
                onPressed: () {
                  Get.toNamed('/settings');
                },
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(
                    () => Center(
                      child: Text(
                        "${dashboardController.cartCount.value}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
