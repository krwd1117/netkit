import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/cli_command.dart';

part 'cli_repository.g.dart';

// SharedPreferences 인스턴스를 제공하는 Provider
// 앱 시작 시 main.dart에서 주입
@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError(); // main.dart에서 override
}

// JSON 파일에서 CLI 명령어 전체를 불러오는 Provider
@riverpod
Future<List<CliCommand>> cliCommands(Ref ref) async {
  // assets에서 JSON 파일 로드
  final jsonString = await rootBundle.loadString(
    'assets/data/cli_commands.json',
  );
  final jsonList = json.decode(jsonString) as List<dynamic>;

  // JSON 리스트 → CliCommand 리스트 변환
  return jsonList.map((e) => CliCommand.fromJson(e)).toList();
}

// 즐겨찾기 ID 목록을 관리하는 Provider
@Riverpod(keepAlive: true)
class FavoriteIds extends _$FavoriteIds {
  static const _key = 'favorite_ids'; // SharedPreferences 키

  @override
  Set<int> build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    // 저장된 즐겨찾기 ID 목록 불러오기
    // 없으면 빈 Set 반환
    final ids = prefs.getStringList(_key) ?? [];
    return ids.map(int.parse).toSet();
  }

  // 즐겨찾기 토글 — 있으면 제거, 없으면 추가
  Future<void> toggle(int id) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final updated = {...state};

    if (updated.contains(id)) {
      updated.remove(id);
    } else {
      updated.add(id);
    }

    // SharedPreferences에 저장
    await prefs.setStringList(_key, updated.map((e) => e.toString()).toList());
    state = updated;
  }
}

// 벤더 목록을 반환하는 Provider
@riverpod
Future<List<String>> vendors(Ref ref) async {
  final commands = await ref.watch(cliCommandsProvider.future);
  // 중복 제거 후 정렬
  return commands.map((e) => e.vendor).toSet().toList()..sort();
}

// 선택된 벤더의 카테고리 목록을 반환하는 Provider
@riverpod
Future<List<String>> categories(Ref ref, String vendor) async {
  final commands = await ref.watch(cliCommandsProvider.future);
  return commands
      .where((e) => e.vendor == vendor)
      .map((e) => e.category)
      .toSet()
      .toList()
    ..sort();
}

// 벤더 + 카테고리 + 검색어로 필터링된 명령어 목록 반환
@riverpod
Future<List<CliCommand>> filteredCommands(
  Ref ref, {
  required String vendor,
  required String category,
  String query = '',
}) async {
  final commands = await ref.watch(cliCommandsProvider.future);
  return commands.where((e) {
    final matchVendor = e.vendor == vendor;
    final matchCategory = e.category == category;
    final matchQuery =
        query.isEmpty ||
        e.title.toLowerCase().contains(query.toLowerCase()) ||
        e.command.toLowerCase().contains(query.toLowerCase());
    return matchVendor && matchCategory && matchQuery;
  }).toList();
}
