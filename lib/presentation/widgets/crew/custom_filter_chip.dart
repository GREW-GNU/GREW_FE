import 'package:flutter/material.dart';
import 'package:grew/core/theme/colors.dart';

// 필터 검색 칩
class CustomFilterChip extends StatelessWidget {
  const CustomFilterChip({
    this.icon,
    required this.label,
    this.activate = false,
    this.onChanged,
  });

  final IconData? icon;
  final String label;
  final bool? activate;
  final Function()? onChanged;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      shape: StadiumBorder(side: BorderSide(color: AppColors.gray20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onChanged,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              if (icon != null)
                Row(
                  children: [
                    Icon(icon, size: 20, color: AppColors.gray60),
                    const SizedBox(width: 8),
                  ],
                ),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Pretendard",
                  color: AppColors.gray60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
