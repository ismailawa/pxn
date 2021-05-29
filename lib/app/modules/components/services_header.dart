import 'package:flutter/material.dart';
import 'package:pxn_mobile/utils/constants.dart';

class ServicesHeader extends StatelessWidget {
  final String title;
  const ServicesHeader({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
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
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
          ],
        ),
      ),
    );
  }
}