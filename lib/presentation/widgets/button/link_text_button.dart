import 'package:flutter/material.dart';

class LinkTextButton extends StatelessWidget {
  const LinkTextButton({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.weight,
    this.underline = false,
    this.underlineThickness = 2.0,
    this.onPressed,
  });

  final String text;
  final Color color;
  final double fontSize;
  final FontWeight weight;
  final bool? underline;
  final double? underlineThickness;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: color,
      ),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: weight,
          fontFamily: "Pretendard",
          decoration: (underline == true)
              ? TextDecoration.underline
              : TextDecoration.none,
          decorationThickness: underlineThickness,
          decorationColor: (underline == true) ? color : null,
        ),
      ),
    );
  }
}
