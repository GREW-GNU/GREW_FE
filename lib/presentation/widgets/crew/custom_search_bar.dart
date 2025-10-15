import 'package:flutter/material.dart';
import 'package:grew/core/theme/colors.dart';

// 검색 바
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.hint, this.onChanged});

  final String hint;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.gray20,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, color: AppColors.gray60, size: 20),
          const SizedBox(width: 24),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(
                  fontFamily: "Pretendard",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
