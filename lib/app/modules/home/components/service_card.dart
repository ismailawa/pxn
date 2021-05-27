
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pxn_mobile/utils/constants.dart';

class ServicesCard extends StatelessWidget {
  final Function onCardPress;
  final String title;
  final String imageUrl;

  const ServicesCard({
    Key key,
    this.title,
    this.imageUrl,
    this.onCardPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20, top: 20, bottom: 25),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            child: InkWell(
              onTap: onCardPress,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: SvgPicture.asset(
                        imageUrl,
                        semanticsLabel: title,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      title,
                      style: kSubtitleStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
