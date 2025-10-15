import 'package:flutter/cupertino.dart';
import 'package:grew/core/theme/colors.dart';
import 'package:grew/presentation/widgets/button/link_text_button.dart';

// 게시글 상세 페이지 본문 부분
class ActivityBody extends StatelessWidget {
  const ActivityBody({
    required this.crew,
    required this.title,
    required this.content,
    required this.datetime,
  });

  final String crew;
  final String title;
  final String content;
  final String datetime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. 게시글 작성 크루 (추후 페이지 이동하도록 수정 예정)
        LinkTextButton(
          text: crew,
          color: AppColors.primaryBlue,
          fontSize: 16,
          weight: FontWeight.w600,
          onPressed: () {},
        ),
        const SizedBox(height: 8),
        // 2. 게시글 제목
        Text(
          title,
          style: TextStyle(
            fontFamily: "Pretendard",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textBlack,
          ),
        ),
        const SizedBox(height: 20),
        // 3. 게시글 본문
        Text(
          content,
          style: TextStyle(
            fontFamily: "Pretendard",
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.textBlack,
          ),
        ),
        const SizedBox(height: 12),
        // 4. 게시글 작성 일시
        Text(
          datetime,
          style: TextStyle(
            fontFamily: "Pretendard",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.gray40,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
