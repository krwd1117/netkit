import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/dns_result.dart';

part 'dns_service.g.dart';

// DNS Lookup 입력값 상태
@Riverpod(keepAlive: true)
class DnsInput extends _$DnsInput {
  @override
  String build() => '';

  void update(String value) => state = value;
}

// DNS Lookup 실행 결과 상태
// AsyncNotifier — 비동기 작업 + 상태관리를 동시에 처리
@riverpod
class DnsLookup extends _$DnsLookup {
  @override
  AsyncValue<DnsResult?> build() => const AsyncValue.data(null); // 초기값

  Future<void> lookup(String host) async {
    // 로딩 상태로 전환
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final stopwatch = Stopwatch()..start(); // 시간 측정 시작

      // Dart 내장 DNS 조회
      final addresses = await InternetAddress.lookup(host);
      stopwatch.stop();

      return DnsResult(
        host: host,
        addresses: addresses.map((e) => e.address).toList(),
        elapsed: stopwatch.elapsed,
      );
    });
  }
}
