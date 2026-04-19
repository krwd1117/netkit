import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/subnet_result.dart';
import 'subnet_calculator.dart';
// build_runner가 생성할 파일을 참조
part 'subnet_provider.g.dart';

// 사용자가 입력한 IP 주소 상태
// keepAlive: true — 화면을 벗어나도 상태 유지
@Riverpod(keepAlive: true)
class IpInput extends _$IpInput {
  @override
  String build() => '';

  // IP 값 업데이트
  void update(String value) => state = value;
}

@Riverpod(keepAlive: true)
class PrefixInput extends _$PrefixInput {
  @override
  int build() => 24;

  // prefix 값 업데이트
  void update(int value) => state = value;
}

// IP와 prefix를 조합해서 계산 결과를 반환하는 Provider
// 읽기 전용 — 함수형으로 작성
@riverpod
SubnetResult? subnetResult(Ref ref) {
  final ip = ref.watch(ipInputProvider); // IP 상태 구독
  final prefix = ref.watch(prefixInputProvider); // prefix 상태 구독

  if (ip.isEmpty) return null;

  return SubnetCalculator.calculate(ip, prefix);
}
