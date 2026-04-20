import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/ping_result.dart';

part 'ping_service.g.dart';

// Ping 입력값 상태
@Riverpod(keepAlive: true)
class PingInput extends _$PingInput {
  @override
  String build() => '';

  void update(String value) => state = value;
}

// Ping 실행 결과 상태
@riverpod
class PingLookup extends _$PingLookup {
  @override
  AsyncValue<PingResult?> build() => const AsyncValue.data(null);

  Future<void> ping(String host) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      // DNS 조회로 IP 주소 획득
      final addresses = await InternetAddress.lookup(host);
      if (addresses.isEmpty) throw Exception('호스트를 찾을 수 없어요');
      final ip = addresses.first.address;

      // 호스트 타입에 따라 시도할 포트 결정
      // IP 입력 → DNS 서버일 가능성 높으므로 53 먼저
      // 도메인 입력 → 웹 서버일 가능성 높으므로 80, 443 먼저
      final isIp = _isIpAddress(host);
      final ports = isIp ? [53, 80, 443, 22] : [80, 443, 53, 22];

      final stopwatch = Stopwatch()..start();

      for (final port in ports) {
        try {
          final socket = await Socket.connect(
            ip,
            port,
            timeout: const Duration(seconds: 2),
          );
          stopwatch.stop();
          socket.destroy();

          return PingResult(
            host: host,
            ip: ip,
            elapsed: stopwatch.elapsed,
            isReachable: true,
          );
        } on SocketException catch (e) {
          // 연결 거부 — 호스트는 살아있음
          if (e.message.contains('Connection refused')) {
            stopwatch.stop();
            return PingResult(
              host: host,
              ip: ip,
              elapsed: stopwatch.elapsed,
              isReachable: true,
            );
          }
          // timeout — 다음 포트 시도
          continue;
        }
      }

      // 모든 포트 실패
      stopwatch.stop();
      return PingResult(
        host: host,
        ip: ip,
        elapsed: stopwatch.elapsed,
        isReachable: false,
      );
    });
  }

  // IP 주소 형식인지 확인
  // 숫자와 점으로만 이루어져 있으면 IP로 판단
  bool _isIpAddress(String host) {
    return RegExp(r'^(\d{1,3}\.){3}\d{1,3}$').hasMatch(host);
  }
}
