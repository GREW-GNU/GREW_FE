import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:grew/presentation/features/crew/views/grew_activity_detail_page.dart';
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
  static const grewActivityDetail = "/grewActivityDetail";
  static const grewRecruitment = "/grewRecruitment";
}

final goRoutesProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.home,
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
        path: AppRoutes.grewActivityDetail,
        name: "grewActivityDetail",
        builder: (ctx, state) => const GrewActivityDetailPage(
          images: [
            "https://dxrmzk8udv4l3.cloudfront.net/review/44f44d25-d102-4cc9-8e14-ed4966f4d27f-___74___3_____.jpeg",
            "https://dxrmzk8udv4l3.cloudfront.net/review/13d98965-bdc8-4663-912c-d7460f5f95fc-__________44___9_____1.jpeg",
            "https://dxrmzk8udv4l3.cloudfront.net/review/44f44d25-d102-4cc9-8e14-ed4966f4d27f-___74___3_____.jpeg",
            "https://dxrmzk8udv4l3.cloudfront.net/review/13d98965-bdc8-4663-912c-d7460f5f95fc-__________44___9_____1.jpeg",
            "https://dxrmzk8udv4l3.cloudfront.net/review/44f44d25-d102-4cc9-8e14-ed4966f4d27f-___74___3_____.jpeg",
            "https://dxrmzk8udv4l3.cloudfront.net/review/13d98965-bdc8-4663-912c-d7460f5f95fc-__________44___9_____1.jpeg",
            "https://dxrmzk8udv4l3.cloudfront.net/review/44f44d25-d102-4cc9-8e14-ed4966f4d27f-___74___3_____.jpeg",
            "https://dxrmzk8udv4l3.cloudfront.net/review/13d98965-bdc8-4663-912c-d7460f5f95fc-__________44___9_____1.jpeg",
          ],
          crew: "유니브",
          title: "반년동안 열심히 만들어서 드디어 출시...",
          content: """
💻 IT동아리 NODE 2025년 2학기 신입부원 모집 안내 💻

NODE는 ⭐️하소연⭐과 ⭐이카루스⭐가 하나로 합쳐져 새롭게 출발하는 IT 동아리입니다.

------------------------------------------------------
📘 STUDY NODE 📘
🔹 개발을 처음 접하는 입문자 대상
🔹 기초 문법 학습
🔹 간단한 실습 중심
🔹 기초 역량을 쌓는 것을 목표

🖥️ 수업 예정 언어 : Python
스터디 수업 일정: 주 5회(19:00 ~ 20:00)
매주차별로 수업 내용이 달라지며, 같은 주차 안에서는 동일한 수업이 반복됩니다. 따라서 주 5회 중 한 번만 들어도 됩니다.

수업은 프로젝트 NODE 부원들이 직접 진행합니다!
STUDY NODE는 면접 없습니다!

그 외 세부 사항들은 모집 완료 후 안내드릴게요.

가두모집기간 운영시간 안내
9/10 11:00~16:00
9/11 11:00~15:30

------------------------------------------------------

NODE와 함께 성장할 여러분을 기다립니다!
          
          """,
          datetime: "2025.09.25 12:34",
        ),
      ),
      GoRoute(
        path: AppRoutes.grewRecruitment,
        name: "grewRecruitment",
        builder: (ctx, state) => const GrewRecruitmentPage(),
      ), // GrewRecruitment
    ],
  );
});
