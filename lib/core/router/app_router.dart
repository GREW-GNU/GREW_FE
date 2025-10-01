import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:grew/presentation/features/crew/views/grew_activity_page.dart';
import 'package:grew/presentation/features/crew/views/grew_info_page.dart';
import 'package:grew/presentation/features/crew/views/grew_page.dart';
import 'package:grew/presentation/features/crew/views/grew_recruitment_page.dart';
import 'package:grew/presentation/features/crew/views/home_page.dart';
import 'package:grew/presentation/features/user/views/my_page.dart';

import '../../presentation/features/onboarding/views/onboarding_page.dart';
import '../../presentation/features/onboarding/views/splash_page.dart';

abstract final class AppRoutes {
  static const splash = "/splash";
  static const onboarding = "/onboarding";
  static const my = "/my";

  static const home = "/";
  static const grew = "/grew";
  static const grewInfo = "/grewInfo";
  static const grewActivity = "/grewActivity";
  static const grewRecruitment = "/grewRecruitment";
}

final goRoutesProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: "splash",
        builder: (ctx, state) => const SplashPage(),
      ), // Splash
      GoRoute(
        path: AppRoutes.onboarding,
        name: "onboarding",
        builder: (ctx, state) => const OnboardingPage(),
      ), // Onboarding
      GoRoute(
        path: AppRoutes.my,
        name: "my",
        builder: (ctx, state) => const MyPage(),
      ), // My
      GoRoute(
        path: AppRoutes.home,
        name: "home",
        builder: (ctx, state) => const HomePage(),
      ), // Home
      GoRoute(
        path: AppRoutes.grew,
        name: "grew",
        builder: (ctx, state) => const GrewPage(),
      ), // Grew
      GoRoute(
        path: AppRoutes.grewInfo,
        name: "grewInfo",
        builder: (ctx, state) => const GrewInfoPage(),
      ), // GrewInfo
      GoRoute(
        path: AppRoutes.grewActivity,
        name: "grewActivity",
        builder: (ctx, state) => const GrewActivityPage(),
      ), // GrewActivity
      GoRoute(
        path: AppRoutes.grewRecruitment,
        name: "grewRecruitment",
        builder: (ctx, state) => const GrewRecruitmentPage(),
      ), // GrewRecruitment
    ],
  );
});
