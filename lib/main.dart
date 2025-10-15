import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grew/core/router/app_router.dart';

void main() async {
  // 바인딩 초기화
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // FlutterNativeSplash 띄우기
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await onSystemInit();
  runApp(const ProviderScope(child: App()));

  WidgetsBinding.instance.addPostFrameCallback((_) {
    // FlutterNativeSplash 제거
    FlutterNativeSplash.remove();
  });
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRoutesProvider);
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // 스크롤 틴트 off
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
        ),
      ),
    );
  }
}

Future<void> onSystemInit() async {
  try {
    // 환경 변수 로딩
    await dotenv.load(fileName: "core/assets/config/.env");
  } catch (e, st) {
    debugPrint("Init Failed: $e\n$st");
  }
}
