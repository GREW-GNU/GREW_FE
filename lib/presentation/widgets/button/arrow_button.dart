import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    super.key,
    required this.title,
    required this.subTitle,
    this.logo,
    required this.rightArrow,
    required this.width,
    required this.height,
    required this.padding,
    required this.borderRadius,
    this.backgroundColor,
    this.titleFontColor,
    this.subTitleFontColor,
    this.onPressed,
  });

  final String title;
  final String subTitle;
  final String? logo;
  final String rightArrow;

  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? titleFontColor;
  final Color? subTitleFontColor;
  final Function()? onPressed;

  Widget _assetImage(
    String path, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
  }) {
    if (path.endsWith('.svg')) {
      return SvgPicture.asset(path, width: width, height: height, fit: fit);
    }
    return Image.asset(path, width: width, height: height, fit: fit);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Ink(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // GREW logo image
            if (logo != null) _assetImage(logo!, width: 60, height: 60),
            const SizedBox(width: 24),
            // Button Text (Title, SubTitle)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: TextStyle(
                      color: titleFontColor,
                      fontSize: 20,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Sub Title
                  Text(
                    subTitle,
                    style: TextStyle(
                      color: subTitleFontColor,
                      fontSize: 12,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // RightArrow image
            _assetImage(rightArrow, width: 10, height: 20),
          ],
        ),
      ),
    );
  }
}
