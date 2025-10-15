import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grew/core/theme/colors.dart';
import 'package:grew/core/theme/strings.dart';
import 'package:grew/presentation/widgets/post/activity_body.dart';
import 'package:grew/presentation/widgets/post/image_carousel.dart';
import 'package:grew/presentation/widgets/post/image_dot_indicator.dart';

class GrewActivityDetailPage extends StatefulWidget {
  const GrewActivityDetailPage({
    super.key,
    required this.images,
    required this.crew,
    required this.title,
    required this.content,
    required this.datetime,
  });

  final List<String> images;
  final String crew;
  final String title;
  final String content;
  final String datetime;

  @override
  State<GrewActivityDetailPage> createState() => _GrewActivityDetailPage();
}

class _GrewActivityDetailPage extends State<GrewActivityDetailPage> {
  late final PageController _pageController;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _jumpTo(int i) {
    if (!_pageController.hasClients) return;
    final max = widget.images.length - 1;
    final target = i.clamp(0, max);
    _pageController.animateToPage(
      target,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasImages = widget.images.isNotEmpty;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        // 뒤로가기 버튼
        leading: IconButton(
          onPressed: () => context.canPop()
              ? context.pop()
              : Navigator.of(context).maybePop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textBlack,
          ),
        ),
        // 헤더 타이틀
        title: const Text(
          AppStrings.grewActivityTitle,
          style: TextStyle(
            color: AppColors.textBlack,
            fontFamily: "Pretendard",
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          if (hasImages)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                child: ImageCarousel(
                  images: widget.images,
                  controller: _pageController,
                  index: _index,
                  onIndexChanged: (i) => setState(() => _index = i),
                ),
              ),
            ),
          if (hasImages)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ImageDotIndicator(
                  length: widget.images.length,
                  index: _index,
                  onTap: _jumpTo,
                ),
              ),
            ),

          // 이미지 하단 본문
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16, hasImages ? 8 : 16, 16, 24),
            sliver: SliverToBoxAdapter(
              child: ActivityBody(
                crew: widget.crew,
                title: widget.title,
                content: widget.content,
                datetime: widget.datetime,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
