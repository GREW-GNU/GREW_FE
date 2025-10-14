import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:grew/core/router/app_router.dart';
import 'package:grew/core/theme/colors.dart';
import 'package:grew/core/theme/spacing.dart';
import 'package:grew/core/theme/strings.dart';
import 'package:grew/presentation/widgets/button/arrow_button.dart';

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
                            const Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    "서그루",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 2,
                                      decorationColor: AppColors.white,
                                      fontFamily: "AppleSDGothicNeo",
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "님 반갑습니다.",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "AppleSDGothicNeo",
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            SvgPicture.asset(
                              'lib/core/assets/icons/bell_icon.svg',
                              width: 24,
                              height: 24,
                              colorFilter: const ColorFilter.mode(
                                AppColors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
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
