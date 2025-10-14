import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grew/core/router/app_router.dart';
import 'package:grew/core/theme/colors.dart';
import 'package:grew/core/theme/spacing.dart';
import 'package:grew/core/theme/strings.dart';
import 'package:grew/presentation/widgets/button/arrow_button.dart';
import 'package:grew/presentation/widgets/button/link_text_button.dart';
import 'package:grew/presentation/widgets/button/svg_icon_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            backgroundColor: AppColors.primaryBlue,
            elevation: 0,
            pinned: false,
            floating: false,
            snap: false,
            expandedHeight: 170.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                // color: AppColors.primaryBlue,
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  // Home Header 사용자 닉네임 표기 및 환영 문구
                                  LinkTextButton(
                                    text: "서그루",
                                    color: AppColors.white,
                                    fontSize: 20.0,
                                    weight: FontWeight.w600,
                                    underline: true,
                                    underlineThickness: 1.0,
                                    onPressed: () {
                                      context.go(AppRoutes.my);
                                    },
                                  ),
                                  Text(
                                    "님 반갑습니다.",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Pretendard",
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            // 알림 icon 버튼
                            SvgIconButton(
                              icon: 'lib/core/assets/icons/bell_icon.svg',
                              size: 32,
                              color: AppColors.white,
                              onPressed: () {
                                context.go(AppRoutes.my);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // CREW 목록 이동 버튼
                        ArrowButton(
                          title: AppStrings.grewEntryPointTitle,
                          subTitle: AppStrings.grewEntryPointSubTitle,
                          logo: "lib/core/assets/icons/grew_logo_blue.png",
                          rightArrow: "lib/core/assets/icons/right_arrow.svg",
                          width: double.maxFinite,
                          height: 88,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          borderRadius: 12,
                          backgroundColor: AppColors.boxGray,
                          titleFontColor: AppColors.backgroundBlack,
                          subTitleFontColor: AppColors.gray80,
                          onPressed: () {
                            context.go(AppRoutes.grew);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 피드 목록
          SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, idx) => Padding(
              padding: EdgeInsets.fromLTRB(
                AppPaddings.horizontalPadding,
                HomeSpacings.postSpacing,
                AppPaddings.horizontalPadding,
                HomeSpacings.postSpacing,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
