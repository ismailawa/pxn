import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/carby/views/map_view.dart';
import 'package:pxn_mobile/app/modules/carby/views/pickup_selection_view.dart';
import 'package:pxn_mobile/app/modules/components/services_header.dart';
import 'package:pxn_mobile/utils/constants.dart';

import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../controllers/carby_controller.dart';

class CarbyView extends GetView<CarbyController> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    ScrollController sController;
    return Obx(
      () => controller.center.value == null
          ? Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
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
                              print(notification.extent);
                              controller.percent(_percent);
                              return true;
                            },
                            child: DraggableScrollableSheet(
                                maxChildSize: 0.9,
                                initialChildSize: 0.4,
                                minChildSize: 0.4,
                                builder: (context, mController) {
                                  sController = mController;
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
                          top: -260 * (1 - controller.percent.value),
                          child: Container(
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                offset: Offset(0, 2),
                                blurRadius: 5,
                              ),
                            ]),
                            child: SafeArea(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 20,
                                  left: 0,
                                  right: 10,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            sController.animateTo(0.4,
                                                duration: Duration(seconds: 2),
                                                curve: Curves.easeIn);
                                            print("working");
                                          },
                                          icon: Icon(Icons.cancel_sharp),
                                        ),
                                        Text(
                                          "Enter destination",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      ],
                                    ),
                                    Flex(
                                      direction: Axis.horizontal,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                DestinationDot(
                                                  color: Colors.green,
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: 3,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                                DestinationDot(
                                                  color: Colors.blue,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 9,
                                          fit: FlexFit.tight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 20),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CabyInput(
                                                  controller: controller
                                                      .pickupController,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                CabyInput(
                                                  controller: controller
                                                      .destinationController,
                                                  hint: "Enter destination",
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
    );
  }
}

class CabyInput extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const CabyInput({
    Key key,
    this.hint = "Enter location",
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: () {},
      textInputAction: TextInputAction.go,
      cursorColor: Color(0xFF1D83AE),
      decoration: InputDecoration(
          isDense: true,
          hintText: hint,
          hintStyle: kSearchPlaceholderStyle,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Color(0xFF1D83AE),
                width: 2,
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }
}

class DestinationDot extends StatelessWidget {
  final Color color;
  const DestinationDot({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
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
    // return FloatingSearchBar(
    //   hint: 'Search...',
    //   scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
    //   transitionDuration: const Duration(milliseconds: 800),
    //   transitionCurve: Curves.easeInOut,
    //   physics: const BouncingScrollPhysics(),
    //   axisAlignment: -1.0,
    //   openAxisAlignment: 0.0,
    //   width: 500,
    //   debounceDelay: const Duration(milliseconds: 500),
    //   onQueryChanged: (query) {
    //     // Call your model, bloc, controller here.
    //   },
    //   // Specify a custom transition to be used for
    //   // animating between opened and closed stated.
    //   transition: CircularFloatingSearchBarTransition(),
    //   actions: [
    //     FloatingSearchBarAction(
    //       showIfOpened: false,
    //       child: CircularButton(
    //         icon: const Icon(Icons.place),
    //         onPressed: () {},
    //       ),
    //     ),
    //     FloatingSearchBarAction.searchToClear(
    //       showIfClosed: false,
    //     ),
    //   ],
    //   builder: (context, transition) {
    //     return ClipRRect(
    //       borderRadius: BorderRadius.circular(8),
    //       child: Material(
    //         color: Colors.white,
    //         elevation: 4.0,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: Colors.accents.map((color) {
    //             return Container(height: 112, color: color);
    //           }).toList(),
    //         ),
    //       ),
    //     );
    //   },
    // );
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
