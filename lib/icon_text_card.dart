import 'package:flutter/material.dart';
import 'constants.dart';

class IconTextCard extends StatelessWidget {
  final IconData icon;
  final String text;
  IconTextCard({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize,
          color: kTitleColor,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          text,
          style: kTextStyle,
        ),
      ],
    );
  }
}
