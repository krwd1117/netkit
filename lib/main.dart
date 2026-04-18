import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

void main() {
  // Flutter 엔진 초기화 보장 (비동기 작업 전 필수)
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: NetKitApp()));
}
