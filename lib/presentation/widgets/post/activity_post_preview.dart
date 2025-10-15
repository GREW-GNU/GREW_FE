import 'package:flutter/material.dart';
import 'package:grew/core/theme/colors.dart';
import 'package:grew/presentation/widgets/button/link_text_button.dart';

// 크루 활동 게시글 미리보기 (목록용)
class ActivityPostPreview extends StatelessWidget {
  const ActivityPostPreview({
    super.key,
    required this.hasImage,
    this.image,
    required this.crew,
    required this.title,
    required this.content,
    required this.datetime,
    required this.onTap,
  });

  final bool hasImage;
  final String? image;
  final String crew;
  final String title;
  final String content;
  final String datetime;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16);

    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasImage)
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AspectRatio(
                      aspectRatio: 4 / 5,
                      child: _buildImage(),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinkTextButton(
                  text: crew,
                  color: AppColors.primaryBlue,
                  fontSize: 14,
                  weight: FontWeight.w500,
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBlack,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: "Pretendard",
                    color: AppColors.gray60,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Text(
                  datetime,
                  style: const TextStyle(
                    fontSize: 10,
                    fontFamily: "Pretendard",
                    color: AppColors.gray60,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (image == null || image!.isEmpty) {
      return Container(color: AppColors.gray20);
    }
    final src = image!;
    if (src.startsWith('http://') || src.startsWith('https://')) {
      return Image.network(src, fit: BoxFit.cover);
    } else {
      return Image.asset(src, fit: BoxFit.cover);
    }
  }
}
