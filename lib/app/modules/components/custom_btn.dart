import 'package:flutter/material.dart';
import 'package:pxn_mobile/utils/constants.dart';

class CustomBtn extends StatelessWidget {
  final String label;
  final Function() onPress;

  const CustomBtn({
    Key key,
    this.label,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: RawMaterialButton(
        onPressed: onPress,
        child: Text(
          label,
          style: kButtonStyle,
        ),
        hoverColor: kPrimaryLabelColor,
        fillColor: Color(0xFF1D83AE),
        constraints: BoxConstraints(
          minWidth: double.maxFinite,
          minHeight: 45,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
