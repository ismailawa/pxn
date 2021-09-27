import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/components/custom_input.dart';

import '../controllers/add_shipping_address_controller.dart';

class AddShippingAddressView extends GetView<AddShippingAddressController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Shipping Address',
            style: TextStyle(
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: Form(
        key: controller.addressFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CustomInput(
                  controller: controller.addressCtrl,
                  validator: controller.validateNotEmpty,
                  icon: Icons.location_city,
                  hint: "Shipping Address",
                ),
                CustomInput(
                  controller: controller.cityCtrl,
                  validator: controller.validateNotEmpty,
                  icon: Icons.location_city,
                  hint: "City",
                ),
                CustomInput(
                  controller: controller.stateCtrl,
                  validator: controller.validateNotEmpty,
                  icon: Icons.location_city,
                  hint: "State",
                ),
                CustomInput(
                  controller: controller.countryCtrl,
                  validator: controller.validateNotEmpty,
                  icon: Icons.location_city,
                  hint: "Country",
                ),
                CustomInput(
                  controller: controller.mobileCtrl,
                  validator: controller.validateNotEmpty,
                  icon: Icons.location_city,
                  hint: "Mobile",
                ),
                CustomInput(
                  controller: controller.portalCodeCtrl,
                  validator: controller.validateNotEmpty,
                  icon: Icons.location_city,
                  hint: "Postal Code",
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: MaterialButton(
                        color: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          controller.submitShippingAddress();
                        },
                        child: controller.isLoading.value
                            ? CircularProgressIndicator()
                            : Text(
                                "Add Address",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
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
