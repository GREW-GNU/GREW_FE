import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grew/core/theme/colors.dart';

class HomeHeader extends ConsumerWidget implements PreferredSizeWidget {
  const HomeHeader({super.key, this.onMyTap, this.onNoticeTap});

  final Function()? onMyTap;
  final Function()? onNoticeTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: AppColors.primaryBlue,
      titleSpacing: 0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
