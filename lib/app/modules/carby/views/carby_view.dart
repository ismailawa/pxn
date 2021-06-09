import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/components/services_header.dart';

import '../controllers/carby_controller.dart';

class CarbyView extends GetView<CarbyController> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Scaffold(
          backgroundColor: Colors.blue.shade100.withOpacity(0.3),
          body: Container(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: ServicesHeader(
                    title: 'Carby',
                  ),
                ),
                Container(
                  height: height,
                  width: width,
                ),
                Positioned(
                  top: height * 0.6,
                  child: Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: Column(
                      children: [
                        TopLine(),
                        SearchBar()
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class TopLine extends StatelessWidget {
  const TopLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 6,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.blue.shade200.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 15,
        right: 15,
      ),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue.shade200.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      Colors.blue.shade200.withOpacity(0.5),
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Where to?",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
