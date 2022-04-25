import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/address_list_controller.dart';

class AddressListView extends GetView<AddressListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text('Shipping Addresses',
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.redAccent),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.toNamed('/add-shipping-address');
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: List.generate(
            controller.user['addAddress'].length,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.location_city_sharp,
                          color: Colors.red,
                        ),
                        Text(
                          'ADDRESS',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          controller.user['addAddress'][index]['address'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(controller.user['addAddress'][index]['state'])
                      ],
                    ),
                    Row(
                      children: [
                        Text(controller.user['addAddress'][index]['localGovt'])
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
