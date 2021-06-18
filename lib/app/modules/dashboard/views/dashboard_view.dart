import 'package:flutter/material.dart';

import 'package:pxn_mobile/app/modules/components/custom_nav_bar.dart';
import 'package:pxn_mobile/app/modules/home/views/home_view.dart';
import 'package:pxn_mobile/app/modules/profile/views/profile_view.dart';
import 'package:pxn_mobile/app/modules/services/views/services_view.dart';
import 'package:pxn_mobile/app/modules/transactions/views/transactions_view.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  String selectedLabel = "home";
  int selectedPage = 0;

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
