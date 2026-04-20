import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/port_result.dart';

part 'port_scanner_service.g.dart';

// 자주 쓰이는 포트와 서비스 이름 매핑
const _commonPorts = {
  21: 'FTP',
  22: 'SSH',
  23: 'Telnet',
  25: 'SMTP',
  53: 'DNS',
  80: 'HTTP',
  110: 'POP3',
  143: 'IMAP',
  443: 'HTTPS',
  445: 'SMB',
  3306: 'MySQL',
  3389: 'RDP',
  5432: 'PostgreSQL',
  6379: 'Redis',
  8080: 'HTTP-Alt',
  8443: 'HTTPS-Alt',
};

// Port Scanner 입력값 상태
@Riverpod(keepAlive: true)
class PortScanInput extends _$PortScanInput {
  @override
  String build() => '';

  void update(String value) => state = value;
}

// Port Scanner 실행 결과 상태
@riverpod
class PortScan extends _$PortScan {
  @override
  AsyncValue<PortScanResult?> build() => const AsyncValue.data(null);

  Future<void> scan(String host) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      // DNS 조회로 IP 획득
      final addresses = await InternetAddress.lookup(host);
      if (addresses.isEmpty) throw Exception('호스트를 찾을 수 없어요');
      final ip = addresses.first.address;

      // 자주 쓰이는 포트 병렬 스캔
      final futures = _commonPorts.entries.map((entry) async {
        final isOpen = await _checkPort(ip, entry.key);
        return PortResult(
          port: entry.key,
          isOpen: isOpen,
          service: entry.value,
        );
      });

      // 모든 포트 스캔 완료 대기
      final results = await Future.wait(futures);

      // 포트 번호 오름차순 정렬
      results.sort((a, b) => a.port.compareTo(b.port));

      return PortScanResult(host: host, ip: ip, ports: results);
    });
  }

  // 단일 포트 열림 여부 확인
  Future<bool> _checkPort(String ip, int port) async {
    try {
      final socket = await Socket.connect(
        ip,
        port,
        timeout: const Duration(seconds: 2),
      );
      socket.destroy();
      return true; // 연결 성공 → 열린 포트
    } on SocketException {
      return false; // 연결 실패 → 닫힌 포트
    }
  }
}
