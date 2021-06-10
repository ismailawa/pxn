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
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Container(
        child: Row(
          children: [
            BackButton(),
            Text(
              title,
              style: kLargeTitleStyle,
            ),
            Spacer(),
            child != null ? child : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
