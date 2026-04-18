import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primary = Color(0xFF0066FF);
  static const primaryDark = Color(0xFF0052CC); // 버튼 눌림 등 강조 시 사용

  // Light theme
  static const bgLight = Color(0xFFF5F7FA); // 전체 배경
  static const surfaceLight = Color(0xFFFFFFFF); // 카드, AppBar 배경
  static const textPrimaryLight = Color(0xFF0D1117); // 본문 텍스트
  static const textSecondaryLight = Color(0xFF6B7280); // 보조 텍스트
  static const dividerLight = Color(0xFFE5E7EB); // 구분선

  // Dark theme
  static const bgDark = Color(0xFF0D1117); // 전체 배경
  static const surfaceDark = Color(0xFF161B22); // 카드, AppBar 배경
  static const textPrimaryDark = Color(0xFFE6EDF3); // 본문 텍스트
  static const textSecondaryDark = Color(0xFF8B949E); // 보조 텍스트
  static const dividerDark = Color(0xFF30363D); // 구분선

  // Semantic
  static const success = Color(0xFF22C55E); // 성공 (Ping OK 등)
  static const warning = Color(0xFFF59E0B); // 경고
  static const error = Color(0xFFEF4444); // 실패 (Ping timeout 등)
  static const info = Color(0xFF3B82F6); // 정보
}
