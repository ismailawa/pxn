import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/onboarding/onboarding_model.dart';
import 'package:pxn_mobile/utils/constants.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              OnboardingHeader(
                onTap: () {
                  if (controller.initialPage.value > 0) {
                    controller.pageController.value.animateToPage(
                        controller
                            .initialPage(controller.initialPage.value - 1),
                        duration: Duration(microseconds: 500),
                        curve: Curves.easeIn);
                  }
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: PageView.builder(
                      controller: controller.pageController.value,
                      itemCount: pages.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.height * 0.4,
                              child: SvgPicture.asset(
                                pages[index].imageUrl,
                                semanticsLabel: pages[index].title,
                              ),
                            ),
                            Text(
                              pages[index].title,
                              style: kLargeTitleStyle,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Something About the product image display here.Something About the product image display here.Something About the product image display here.',
                              style: kSubtitleStyle,
                              textAlign: TextAlign.center,
                            )
                          ],
                        );
                      }),
                ),
              ),
              OnboardingIndicator(
                count: pages.length,
                ontap: () {
                  if (controller.initialPage.value < pages.length) {
                    controller.pageController.value.animateToPage(
                        controller
                            .initialPage(controller.initialPage.value + 1),
                        duration: Duration(microseconds: 500),
                        curve: Curves.easeIn);
                  }
                },
                page: controller.initialPage.value,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingIndicator extends StatelessWidget {
  final int count;
  final int page;
  final Function ontap;
  const OnboardingIndicator({
    Key key,
    this.page,
    this.ontap,
    this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      margin: EdgeInsets.only(left: 12, right: 12, bottom: 30),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 90,
              width: 90,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(pxnSecondaryColor),
                value: (page + 1) / (count),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: ontap,
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  color: pxnSecondaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OnboardingHeader extends StatelessWidget {
  final Function onTap;
  const OnboardingHeader({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.all(
        16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
          TextButton(
              onPressed: () {
                Get.offNamed('/login');
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ))
        ],
      ),
    );
  }
}
