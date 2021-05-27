import 'package:flutter/material.dart';
import 'package:pxn_mobile/utils/constants.dart';

class NavBtn extends StatelessWidget {
  final bool isSelected;
  final Function(dynamic) onSelected;
  final String label;
  final IconData icon;

  const NavBtn({
    Key key,
    this.isSelected = false,
    this.label,
    this.icon,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? InkWell(
            onTap: () => onSelected(label),
            child: Ink(
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Colors.blueGrey.withOpacity(0.9),
                    pxnSecondaryColor,
                  ]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(label, style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          )
        : InkWell(
            onTap: () => onSelected(label),
            child: Ink(
              child: BNBIcon(
                icon: icon,
              ),
            ),
          );
  }
}

class BNBIcon extends StatelessWidget {
  final IconData icon;
  const BNBIcon({
    Key key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 30,
      color: Colors.grey,
    );
  }
}
