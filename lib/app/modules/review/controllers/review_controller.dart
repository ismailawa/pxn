import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/data/models/product.dart';
import 'package:pxn_mobile/app/data/providers/general_provider.dart';

class ReviewController extends GetxController {
  final localStorage = GetStorage();
  GeneralProvider generalProvider = Get.put<GeneralProvider>(GeneralProvider());

  Rx<Product> product = Rx<Product>(null);
  RxInt reviews = RxInt(0);
  TextEditingController comments;
  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();

    product(Get.arguments);
    comments = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void addReview() async {
    if (comments.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your review',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    Get.dialog(
      AlertDialog(
        title: Text('Review'),
        content: Text('Are you sure you want to add this review?'),
        actions: <Widget>[
          MaterialButton(
            child: Text('Cancel'),
            onPressed: () {
              Get.back();
            },
          ),
          MaterialButton(
            child: Text('Add'),
            onPressed: () async {
              Get.back();
              isLoading(true);
              try {
                var result = await generalProvider.createReview({
                  'rating': reviews.value,
                  'message': comments.text,
                  'product_id': product.value.id
                });
                isLoading(false);
                Get.snackbar('Success', 'Review added successfully',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    colorText: Colors.white);
              } catch (e) {
                isLoading(false);
                Get.snackbar('Error', e.toString(),
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white);
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void onClose() {
    super.onClose();
    comments.dispose();
  }
}
