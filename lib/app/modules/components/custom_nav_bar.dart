import 'package:flutter/material.dart';
import 'package:pxn_mobile/app/modules/components/nav_bar_btn.dart';

class CustomNavBar extends StatelessWidget {
  final Function(dynamic) onSelected;
  final String selectedLabel;

  const CustomNavBar({
    Key key,
    this.onSelected,
    this.selectedLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BottomAppBar(
        child: Container(
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavBtn(
                icon: Icons.home,
                label: "Home",
                isSelected: selectedLabel.toLowerCase().compareTo("home") == 0,
                onSelected: onSelected,
              ),
              NavBtn(
                icon: Icons.shopping_cart,
                label: "Shop",
                isSelected: selectedLabel.toLowerCase().compareTo("shop") == 0,
                onSelected: onSelected,
              ),
              NavBtn(
                icon: Icons.business,
                label: "Orders",
                isSelected:
                    selectedLabel.toLowerCase().compareTo("orders") == 0,
                onSelected: onSelected,
              ),
              NavBtn(
                icon: Icons.account_circle_rounded,
                label: "Profile",
                isSelected:
                    selectedLabel.toLowerCase().compareTo("profile") == 0,
                onSelected: onSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
