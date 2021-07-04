import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/dashboard/controllers/dashboard_controller.dart';

class HeaderSection extends StatelessWidget {
  final dbController = Get.put(DashboardController());
  HeaderSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            child: Icon(Icons.person),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Get.toNamed('/settings');
            },
          )
        ],
      ),
    );
  }
}
