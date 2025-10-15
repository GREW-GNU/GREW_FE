import 'package:flutter/cupertino.dart';
import 'package:grew/core/theme/colors.dart';

// 이미지 하단 인디케이터
class ImageDotIndicator extends StatelessWidget {
  const ImageDotIndicator({
    required this.length,
    required this.index,
    required this.onTap,
  });

  final int length;
  final int index;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    if (length <= 1) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (i) {
        final active = i == index;
        return GestureDetector(
          onTap: () => onTap(i),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: active ? 10 : 8,
            height: active ? 10 : 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: active ? AppColors.primaryBlue : AppColors.gray20,
            ),
          ),
        );
      }),
    );
  }
}
