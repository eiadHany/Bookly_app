import 'package:bookly_app/core/uitls/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backGroundColor,
      required this.text,
      required this.textColor,
      this.borderRadius,
      this.onPressed});
  final Color backGroundColor;
  final Color textColor;
  final String text;
  final BorderRadius? borderRadius;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(16)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.textStyle16
              .copyWith(color: textColor, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
