import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import 'package:pxn_mobile/app/modules/components/custom_nav_bar.dart';
import 'package:pxn_mobile/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:pxn_mobile/app/modules/home/views/home_view.dart';
import 'package:pxn_mobile/app/modules/profile/views/profile_view.dart';
import 'package:pxn_mobile/app/modules/services/views/services_view.dart';
import 'package:pxn_mobile/app/modules/transactions/views/transactions_view.dart';
import 'package:showcaseview/showcaseview.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  String selectedLabel = "home";
  int selectedPage = 0;
  // GlobalKey _one = GlobalKey();
  DashboardController controller = Get.put(DashboardController());
  // GlobalKey _two = GlobalKey();
  // GlobalKey _three = GlobalKey();

  _setSelectedPage(String label) {
    switch (label.toLowerCase()) {
      case "home":
        setState(() {
          selectedPage = 0;
          selectedLabel = label;
        });
        break;
      case "trans":
        setState(() {
          selectedPage = 1;
          selectedLabel = label;
        });
        break;
      case "services":
        setState(() {
          selectedPage = 2;
          selectedLabel = label;
        });
        break;
      case "profile":
        setState(() {
          selectedPage = 3;
          selectedLabel = label;
        });
        break;
      default:
        setState(() {
          selectedPage = 0;
        });
    }
  }

  List<Widget> pages = <Widget>[
    HomeView(),
    TransactionsView(),
    ServicesView(),
    ProfileView()
  ];

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback(
    //     (_) => ShowCaseWidget.of(context).startShowCase([controller.one]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar: CustomNavBar(
        onSelected: (label) {
          _setSelectedPage(label);
        },
        selectedLabel: selectedLabel,
      ),
    );
  }
}

// class KeysToBeInherited extends InheritedWidget {
//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//     return true;
//   }
// }
