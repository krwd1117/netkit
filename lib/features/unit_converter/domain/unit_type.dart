// 변환 카테고리 열거형
enum UnitCategory {
  bandwidth, // 대역폭
  dataSize, // 데이터 크기
  time, // 시간
}

// 단위 정의
class UnitDefinition {
  final String label; // 표시 이름 (예: Mbps)
  final double toBase; // 기준 단위로 변환 배율
  final UnitCategory category;

  const UnitDefinition({
    required this.label,
    required this.toBase,
    required this.category,
  });
}

// 전체 단위 목록
// 각 카테고리의 기준 단위: bps, Byte, ms
const unitDefinitions = [
  // 대역폭 — 기준: bps
  UnitDefinition(label: 'bps', toBase: 1, category: UnitCategory.bandwidth),
  UnitDefinition(label: 'Kbps', toBase: 1000, category: UnitCategory.bandwidth),
  UnitDefinition(
    label: 'Mbps',
    toBase: 1000000,
    category: UnitCategory.bandwidth,
  ),
  UnitDefinition(
    label: 'Gbps',
    toBase: 1000000000,
    category: UnitCategory.bandwidth,
  ),

  // 데이터 크기 — 기준: Byte
  UnitDefinition(label: 'B', toBase: 1, category: UnitCategory.dataSize),
  UnitDefinition(label: 'KB', toBase: 1024, category: UnitCategory.dataSize),
  UnitDefinition(label: 'MB', toBase: 1048576, category: UnitCategory.dataSize),
  UnitDefinition(
    label: 'GB',
    toBase: 1073741824,
    category: UnitCategory.dataSize,
  ),
  UnitDefinition(
    label: 'TB',
    toBase: 1099511627776,
    category: UnitCategory.dataSize,
  ),

  // 시간 — 기준: ms
  UnitDefinition(label: 'ms', toBase: 1, category: UnitCategory.time),
  UnitDefinition(label: 's', toBase: 1000, category: UnitCategory.time),
  UnitDefinition(label: 'min', toBase: 60000, category: UnitCategory.time),
  UnitDefinition(label: 'hr', toBase: 3600000, category: UnitCategory.time),
];

// 카테고리별 단위 필터링 헬퍼
List<UnitDefinition> unitsOf(UnitCategory category) =>
    unitDefinitions.where((e) => e.category == category).toList();
