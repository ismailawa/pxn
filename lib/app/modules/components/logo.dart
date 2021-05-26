import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double size;
  const Logo({
    Key key,
    this.size = 80.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
