import 'package:flutter/material.dart';

class RoundedRectangleTextButton extends StatelessWidget {
  const RoundedRectangleTextButton({
    super.key,
    required this.text,
    this.height = 40,
    this.radius = 12,
    required this.textColor,
    required this.buttonColor,
    this.onPressed,
  });

  final String text;
  final double height;
  final double radius;
  final Color textColor;
  final Color buttonColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontFamily: "Pretendard",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
