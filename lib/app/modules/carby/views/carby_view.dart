import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/carby/views/map_view.dart';
import 'package:pxn_mobile/app/modules/carby/views/pickup_selection_view.dart';
import 'package:pxn_mobile/app/modules/components/services_header.dart';

import '../controllers/carby_controller.dart';

class CarbyView extends GetView<CarbyController> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Obx(
      () => controller.center.value == null
          ? Container()
          : Container(
              color: Colors.white,
              child: Scaffold(
                  backgroundColor: Colors.blue.shade100.withOpacity(0.3),
                  body: Container(
                    child: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.72,
                          child: MapView(
                            center: controller.center.value,
                            onCreate: controller.onCreate,
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                          ),
                          child: ServicesHeader(
                            title: 'Caby',
                          ),
                        ),
                        Container(
                          height: height,
                          width: width,
                        ),
                        Visibility(
                          child: NotificationListener<
                              DraggableScrollableNotification>(
                            onNotification: (notification) {
                              final _percent = 2 * notification.extent - 0.8;
                              controller.percent(_percent);
                              print(_percent);
                              return true;
                            },
                            child: DraggableScrollableSheet(
                                maxChildSize: 0.9,
                                initialChildSize: 0.4,
                                minChildSize: 0.4,
                                builder: (context, mController) {
                                  return PickupSelectionView(
                                    mController: mController,
                                    controller: controller.pickupController,
                                    onTap: (mcontext) {
                                      controller.onPickupFieldTap(mcontext);
                                    },
                                  );
                                  // ),
                                }),
                          ),
                          // child: PickupSelectionView(
                          //   controller: controller.pickupController,
                          //   onTap: (mcontext) {
                          //     controller.onPickupFieldTap(mcontext);
                          //   },
                          // ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: -200 * (1 - controller.percent.value),
                          child: Container(
                            height: 200,
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                offset: Offset(0, 5),
                                blurRadius: 10,
                              ),
                            ]),
                          ),
                        )
                        // Positioned(
                        //   top: height * 0.6,
                        //   child: Container(
                        //     height: height,
                        //     width: width,
                        //     decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.only(
                        //           topLeft: Radius.circular(20),
                        //           topRight: Radius.circular(20),
                        //         )),
                        //     child: Column(
                        //       children: [TopLine(), SearchBar()],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  )),
            ),
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
  final String hint;
  final Function search;

  const SearchBar({
    Key key,
    this.hint = "Where to?",
    this.search,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: search,
        child: Padding(
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
                      color: Colors.blue.shade200.withOpacity(0.5),
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
                    hint,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
