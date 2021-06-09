import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
 var pageController = PageController().obs;
  var initialPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController.value.addListener(() {
      initialPage(pageController.value.page.round());
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
