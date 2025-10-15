import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grew/core/theme/colors.dart';
import 'package:grew/core/theme/strings.dart';
import 'package:grew/presentation/widgets/crew/custom_search_bar.dart';
import 'package:grew/presentation/widgets/crew/custom_filter_chip.dart';
import 'package:grew/presentation/widgets/crew/custom_sort_button.dart';

class GrewListPage extends StatefulWidget {
  const GrewListPage({super.key});

  @override
  State<GrewListPage> createState() => _GrewListPage();
}

class _GrewListPage extends State<GrewListPage> {
  final List<String> _sortOptions = const [
    AppStrings.sortLatestActivities,
    AppStrings.sortMostActivities,
    AppStrings.sortFirstName,
    AppStrings.sortMostScrap,
    AppStrings.sortLatestOpen,
  ];

  String _defaultSelectedSort = AppStrings.sortLatestActivities;

  Future<void> _openSortSheet() async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.white,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        // 높이 너무 커지지 않게 제한
        final maxH = MediaQuery.of(ctx).size.height * 0.55;
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxH),
          child: ListView.separated(
            itemCount: _sortOptions.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, i) {
              final label = _sortOptions[i];
              final active = label == _defaultSelectedSort;
              return ListTile(
                title: Text(label),
                trailing: active
                    ? const Icon(Icons.check, color: Colors.black87)
                    : null,
                onTap: () => Navigator.of(context).pop(label),
              );
            },
          ),
        );
      },
    );

    if (selected != null && selected != _defaultSelectedSort) {
      setState(() => _defaultSelectedSort = selected);
      // TODO: 실제 정렬 적용 로직 연결
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.canPop()
              ? context.pop()
              : Navigator.of(context).maybePop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textBlack,
          ),
        ),
        title: const Text(
          AppStrings.title,
          style: TextStyle(
            color: AppColors.textBlack,
            fontFamily: "Pretendard",
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: CustomSearchBar(hint: AppStrings.searcHint),
            // child: _SearchBar(hint: AppStrings.searcHint),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        CustomFilterChip(
                          icon: Icons.star_outlined,
                          label: "스크랩",
                        ),
                        const SizedBox(width: 4),
                        CustomFilterChip(label: "모집중"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                CustomSortButton(
                  label: _defaultSelectedSort,
                  onTap: _openSortSheet,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: _ListSkeletonCard(index: index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListSkeletonCard extends StatelessWidget {
  const _ListSkeletonCard({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96, // 자리만 확보
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12.withOpacity(0.15)),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // 썸네일 자리
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 64,
              height: double.infinity,
              color: Colors.black12,
            ),
          ),
          const SizedBox(width: 12),
          // 텍스트 자리
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 8),
                // 제목
                _GrayBar(width: 140),
                SizedBox(height: 8),
                // 태그/설명
                _GrayBar(width: 200),
                SizedBox(height: 8),
                _GrayBar(width: 120),
              ],
            ),
          ),
          // 즐겨찾기 아이콘 자리
          const Icon(Icons.star_border_rounded, color: Colors.black38),
        ],
      ),
    );
  }
}

class _GrayBar extends StatelessWidget {
  const _GrayBar({required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 12,
      decoration: BoxDecoration(
        color: const Color(0xFFEDEEF1),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
