import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/unit_type.dart';

part 'converter_provider.g.dart';

// 선택된 카테고리 상태
@Riverpod(keepAlive: true)
class SelectedCategory extends _$SelectedCategory {
  @override
  UnitCategory build() => UnitCategory.bandwidth; // 초기값

  void update(UnitCategory category) => state = category;
}

// 입력값 상태
@Riverpod(keepAlive: true)
class ConverterInput extends _$ConverterInput {
  @override
  String build() => '';

  void update(String value) => state = value;
}

// 입력 단위 상태
@Riverpod(keepAlive: true)
class FromUnit extends _$FromUnit {
  @override
  UnitDefinition build() => unitsOf(UnitCategory.bandwidth).first;

  void update(UnitDefinition unit) => state = unit;
}

// 출력 단위 상태
@Riverpod(keepAlive: true)
class ToUnit extends _$ToUnit {
  @override
  UnitDefinition build() => unitsOf(UnitCategory.bandwidth)[2]; // Mbps

  void update(UnitDefinition unit) => state = unit;
}

// 변환 결과 계산 Provider
@riverpod
String conversionResult(Ref ref) {
  final input = ref.watch(converterInputProvider);
  final from = ref.watch(fromUnitProvider);
  final to = ref.watch(toUnitProvider);

  if (input.isEmpty) return '';

  final value = double.tryParse(input);
  if (value == null) return '올바른 숫자를 입력하세요';

  // 입력값 → 기준 단위 → 출력 단위 변환
  final baseValue = value * from.toBase;
  final result = baseValue / to.toBase;

  // 소수점 정리 — 정수면 정수로, 아니면 최대 6자리
  if (result == result.truncateToDouble()) {
    return result.toStringAsFixed(0);
  }
  return result.toStringAsFixed(6).replaceAll(RegExp(r'0+$'), '');
}
