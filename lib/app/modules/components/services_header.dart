import 'package:flutter/material.dart';
import 'package:pxn_mobile/utils/constants.dart';

class ServicesHeader extends StatelessWidget {
  final String title;
  final Widget child;
  final Function onPress;

  const ServicesHeader({
    Key key,
    this.title,
    this.child,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      color: Colors.white,
      child: Row(
        children: [
          BackButton(
            color: Colors.redAccent,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
          Spacer(),
          child != null ? child : SizedBox.shrink(),
        ],
      ),
    );
  }
}
