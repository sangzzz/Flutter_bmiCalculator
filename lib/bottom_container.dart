import 'package:flutter/material.dart';
import 'constants.dart';

class BottomContainer extends StatelessWidget {
  final Function onTap;
  final String text;
  BottomContainer({this.onTap, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: kTextStyle.copyWith(
              color: Colors.white,
              fontSize: 30.0,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
      color: kBottomContainerColor,
      margin: EdgeInsets.only(top: kBottomContainerTopMargin),
      width: double.infinity,
      height: kBottomContainerHeight,
    );
  }
}
