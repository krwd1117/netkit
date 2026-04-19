import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'features/cli_ref/application/cli_repository.dart';

void main() async {
  // Flutter 엔진 초기화 보장 (비동기 작업 전 필수)
  WidgetsFlutterBinding.ensureInitialized();

  // SharedPreferences 인스턴스를 앱 시작 시 미리 생성
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        // sharedPreferencesProvider를 실제 인스턴스로 override
        // → 앱 전체에서 같은 인스턴스를 공유
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const NetKitApp(),
    ),
  );
}
