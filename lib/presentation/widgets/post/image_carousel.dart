import 'package:flutter/cupertino.dart';
import 'package:grew/core/theme/colors.dart';

// 이미지 뷰 컨테이너
class ImageCarousel extends StatelessWidget {
  const ImageCarousel({
    required this.images,
    required this.controller,
    required this.index,
    required this.onIndexChanged,
    this.radius = 12,
    this.aspectRatio = 4 / 5,
  });

  final List<String> images;
  final PageController controller;
  final int index;
  final ValueChanged<int> onIndexChanged;
  final double radius;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) return const SizedBox.shrink();

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: PageView.builder(
          controller: controller,
          onPageChanged: onIndexChanged,
          itemCount: images.length,
          itemBuilder: (context, i) => _buildImage(images[i]),
        ),
      ),
    );
  }

  Widget _buildImage(String src) {
    final isNet = src.startsWith("http://") || src.startsWith("https://");
    if (isNet) {
      return Image.network(
        src,
        fit: BoxFit.cover,
        loadingBuilder: (c, child, progress) =>
            progress == null ? child : const ColoredBox(color: AppColors.white),
        errorBuilder: (c, e, s) => const ColoredBox(color: AppColors.white),
      );
    } else {
      return Image.asset(src, fit: BoxFit.cover);
    }
  }
}
