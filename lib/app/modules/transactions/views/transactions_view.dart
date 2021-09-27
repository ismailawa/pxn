import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/components/sections_header.dart';
import 'package:pxn_mobile/utils/constants.dart';

import '../controllers/transactions_controller.dart';

class TransactionsView extends GetView<TransactionsController> {
  var ctrl = Get.put(TransactionsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100.withOpacity(0.3),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            HeaderSection(),
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 50,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        ButtonTransac(
                          label: "All Trans",
                          onTap: () => controller.selectedIndex(0),
                          isActive: controller.selectedIndex.value == 0,
                        ),
                        ButtonTransac(
                          onTap: () => controller.selectedIndex(1),
                          isActive: controller.selectedIndex.value == 1,
                        ),
                        ButtonTransac(
                          label: "Cable",
                          isActive: controller.selectedIndex.value == 2,
                          onTap: () => controller.selectedIndex(2),
                        ),
                        ButtonTransac(
                          label: "Electricity",
                          isActive: controller.selectedIndex.value == 3,
                          onTap: () => controller.selectedIndex(3),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonTransac extends StatelessWidget {
  final String label;
  final bool isActive;
  final Function onTap;
  const ButtonTransac({
    Key key,
    this.label = "Data",
    this.isActive = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: isActive ? pxnPrimaryColor : pxnSecondaryColor,
          ),
          child: Center(
            child: Text(label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                )),
          ),
        ),
      ),
    );
  }
}
