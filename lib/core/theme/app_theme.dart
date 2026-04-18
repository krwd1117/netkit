import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  // Light
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      surface: AppColors.surfaceLight,
    ),
    scaffoldBackgroundColor: AppColors.bgLight,
    textTheme: _textTheme(AppColors.textPrimaryLight),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfaceLight,
      foregroundColor: AppColors.textPrimaryLight,
      elevation: 0, // 그림자 제거
      centerTitle: false, // 타이틀 왼쪽 정렬
      titleTextStyle: GoogleFonts.dmSans(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimaryLight,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surfaceLight,
      indicatorColor: AppColors.primary.withValues(alpha: 0.12), // 선택된 탭 배경
      labelTextStyle: WidgetStateProperty.all(
        GoogleFonts.dmSans(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimaryLight,
        ),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.dividerLight,
      thickness: 1,
    ),
    cardTheme: CardThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.dividerLight),
      ),
    ),
  );

  // Dark
  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      surface: AppColors.surfaceDark,
    ),
    scaffoldBackgroundColor: AppColors.bgDark,
    textTheme: _textTheme(AppColors.textPrimaryDark),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      foregroundColor: AppColors.textPrimaryDark,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: GoogleFonts.dmSans(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimaryDark,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surfaceDark,
      indicatorColor: AppColors.primary.withOpacity(0.2),
      labelTextStyle: WidgetStateProperty.all(
        GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.dividerDark,
      thickness: 1,
    ),
    cardTheme: CardThemeData(
      color: AppColors.surfaceDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.dividerDark),
      ),
    ),
  );

  // 공통 텍스트
  static TextTheme _textTheme(Color primary) => TextTheme(
    // 화면 제목 등 큰 텍스트 — DM Sans 사용
    displayLarge: GoogleFonts.dmSans(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: primary,
    ),
    titleLarge: GoogleFonts.dmSans(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: primary,
    ),
    titleMedium: GoogleFonts.dmSans(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: primary,
    ),
    bodyLarge: GoogleFonts.dmSans(fontSize: 16, color: primary),
    bodyMedium: GoogleFonts.dmSans(fontSize: 14, color: primary),

    // CLI 명령어, IP 주소 등 코드성 텍스트 — IBM Plex Mono 사용
    labelLarge: GoogleFonts.ibmPlexMono(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: primary,
    ),
    labelMedium: GoogleFonts.ibmPlexMono(fontSize: 12, color: primary),
  );
}
