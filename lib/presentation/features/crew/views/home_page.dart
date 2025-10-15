import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:grew/core/router/app_router.dart';
import 'package:grew/core/theme/colors.dart';
import 'package:grew/core/theme/strings.dart';
import 'package:grew/presentation/widgets/button/arrow_button.dart';
import 'package:grew/presentation/widgets/button/link_text_button.dart';
import 'package:grew/presentation/widgets/button/svg_icon_button.dart';

import '../../../widgets/post/activity_post_preview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          // 헤더 영역
          SliverAppBar(
            backgroundColor: AppColors.primaryBlue,
            elevation: 0,
            pinned: true,
            floating: false,
            snap: false,
            stretch: true,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            expandedHeight: 170.0,
            flexibleSpace: FlexibleSpaceBar(
              background: SafeArea(
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
                                // 헤더 유저 정보 표시
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
                                const SizedBox(width: 4),
                                const Text(
                                  AppStrings.welcomeText,
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
                          // 알림 버튼
                          SvgIconButton(
                            icon: 'lib/core/assets/icons/bell_icon.svg',
                            size: 28,
                            color: AppColors.white,
                            onPressed: () {
                              context.go(AppRoutes.my);
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),
                      // GREW 리스트 페이지로 이동
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
                        titleFontColor: AppColors.textBlack,
                        subTitleFontColor: AppColors.gray80,
                        onPressed: () {
                          context.push(AppRoutes.grew);
                          // context.go(AppRoutes.grew);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 피드 박스 시작
          SliverAppBar(
            backgroundColor: AppColors.primaryBlue,
            elevation: 0,
            pinned: true,
            floating: false,
            snap: false,
            stretch: false,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            toolbarHeight: 0,
            collapsedHeight: 16,
            expandedHeight: 16,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                height: 16,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
              ),
            ),
          ),

          // 최근 피드 리스트 콘텐츠
          SliverList(
            delegate: SliverChildBuilderDelegate((context, idx) {
              return Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(16),
                  child: ActivityPostPreview(
                    hasImage: true,
                    image:
                        "https://dxrmzk8udv4l3.cloudfront.net/review/44f44d25-d102-4cc9-8e14-ed4966f4d27f-___74___3_____.jpeg",
                    crew: '교지편집위원회',
                    title: '✨개척자 교지편집위원회 대동제 부스✨',
                    content:
                        '틀린 질문도 괜찮아 알잖아 난 항상 똑같아 대답은 바르게 해줄게 나에게 뭐든 물어봐 틀린 질문도 괜찮아 알잖아 난 항상 똑같아 대답은 바르게 해줄게',
                    datetime: '2025.09.12 19:38',
                    onTap: () {
                      // context.go(AppRoutes.grewActivityDetail);
                      context.push(AppRoutes.grewActivityDetail);
                    },
                  ),
                ),
              );
            }, childCount: 10),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
