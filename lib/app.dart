import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'router.dart';

class NetKitApp extends ConsumerWidget {
  const NetKitApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'NetKit',
      debugShowCheckedModeBanner: false,
      // 라이트 / 다크 테마 연결
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system, // 시스템 설정에 따라 테마 자동 변경
      // 라우터 설정
      home: const MainShell(),
    );
  }
}
