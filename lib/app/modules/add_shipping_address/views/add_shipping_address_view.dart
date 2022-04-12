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
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.redAccent),
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
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 15,
                  ),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.location_city,
                        color: Colors.redAccent,
                      ),
                      hintText: "Select State",
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: "Plateau",
                        child: Text('Plateau'),
                      ),
                      DropdownMenuItem(
                        value: "Bauchi",
                        child: Text('Bauchi'),
                      ),
                      DropdownMenuItem(
                        value: "Abuja",
                        child: Text('Abuja'),
                      )
                    ],
                    onChanged: (value) {
                      controller.selectedState = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: DropdownButtonFormField(
                    onChanged: (value) {
                      controller.selectedLGA = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Select LGA",
                      prefixIcon: Icon(
                        Icons.location_city,
                        color: Colors.redAccent,
                      ),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: "Barkin Ladi",
                        child: Text('Barkin Ladi'),
                      ),
                      DropdownMenuItem(
                        value: "Bassa",
                        child: Text('Bassa'),
                      ),
                      DropdownMenuItem(
                        value: "Bokkos",
                        child: Text('Bokkos'),
                      ),
                      DropdownMenuItem(
                        value: "Jos-East",
                        child: Text('Jos-East'),
                      ),
                      DropdownMenuItem(
                        value: "Jos-North",
                        child: Text('Jos-North'),
                      ),
                      DropdownMenuItem(
                        value: "Jos-South",
                        child: Text('Jos-South'),
                      ),
                      DropdownMenuItem(
                        value: "Kanam",
                        child: Text('Kanam'),
                      ),
                      DropdownMenuItem(
                        value: "Kanke",
                        child: Text('Kanke'),
                      ),
                      DropdownMenuItem(
                        value: "Langtang North",
                        child: Text('Langtang North'),
                      ),
                      DropdownMenuItem(
                        value: "Langtang South",
                        child: Text("Langtang South"),
                      ),
                      DropdownMenuItem(
                        value: "Mangu",
                        child: Text('Mangu'),
                      ),
                      DropdownMenuItem(
                        value: "Mikang",
                        child: Text('Mikang'),
                      ),
                      DropdownMenuItem(
                        value: "Pankshin",
                        child: Text('Pankshin'),
                      ),
                      DropdownMenuItem(
                        value: "Qua'an Pan",
                        child: Text("Qua'an Pan"),
                      ),
                      DropdownMenuItem(
                        value: "Riyom",
                        child: Text("Riyom"),
                      ),
                      DropdownMenuItem(
                        value: "Shendam",
                        child: Text("Shendam"),
                      ),
                      DropdownMenuItem(
                        value: "Wase",
                        child: Text("Wase"),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: MaterialButton(
                        color: Colors.redAccent,
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
