import 'package:flutter_test/flutter_test.dart';
import 'package:netkit/features/subnet/application/subnet_calculator.dart';

void main() {
  // 테스트 그룹으로 묶어서 관련 테스트끼리 정리
  group('SubnetCalculator', () {
    // 정상 케이스
    group('정상 케이스', () {
      test('/24 계산이 올바른지 확인', () {
        final result = SubnetCalculator.calculate('192.168.1.0', 24);

        // null이 아닌지 먼저 확인
        expect(result, isNotNull);
        expect(result!.networkAddress, '192.168.1.0');
        expect(result.broadcastAddress, '192.168.1.255');
        expect(result.subnetMask, '255.255.255.0');
        expect(result.wildcardMask, '0.0.0.255');
        expect(result.firstHost, '192.168.1.1');
        expect(result.lastHost, '192.168.1.254');
        expect(result.totalHosts, 256);
        expect(result.usableHosts, 254);
      });

      test('/8 계산이 올바른지 확인', () {
        final result = SubnetCalculator.calculate('10.0.0.0', 8);

        expect(result, isNotNull);
        expect(result!.networkAddress, '10.0.0.0');
        expect(result.broadcastAddress, '10.255.255.255');
        expect(result.subnetMask, '255.0.0.0');
        expect(result.wildcardMask, '0.255.255.255');
        expect(result.firstHost, '10.0.0.1');
        expect(result.lastHost, '10.255.255.254');
        expect(result.totalHosts, 16777216); // 2^24
        expect(result.usableHosts, 16777214);
      });

      test('/16 계산이 올바른지 확인', () {
        final result = SubnetCalculator.calculate('172.16.0.0', 16);

        expect(result, isNotNull);
        expect(result!.networkAddress, '172.16.0.0');
        expect(result.broadcastAddress, '172.16.255.255');
        expect(result.subnetMask, '255.255.0.0');
        expect(result.wildcardMask, '0.0.255.255');
        expect(result.totalHosts, 65536); // 2^16
        expect(result.usableHosts, 65534);
      });

      test('/30 계산이 올바른지 확인 (P2P 링크에서 자주 쓰임)', () {
        final result = SubnetCalculator.calculate('192.168.1.0', 30);

        expect(result, isNotNull);
        expect(result!.networkAddress, '192.168.1.0');
        expect(result.broadcastAddress, '192.168.1.3');
        expect(result.subnetMask, '255.255.255.252');
        expect(result.wildcardMask, '0.0.0.3');
        expect(result.firstHost, '192.168.1.1');
        expect(result.lastHost, '192.168.1.2');
        expect(result.totalHosts, 4);
        expect(result.usableHosts, 2);
      });
    });

    // 엣지 케이스
    group('엣지 케이스', () {
      test('/32 단일 호스트 — 사용 가능한 호스트 0개', () {
        final result = SubnetCalculator.calculate('192.168.1.1', 32);

        expect(result, isNotNull);
        expect(result!.totalHosts, 1);
        expect(result.usableHosts, 0);
        // 사용 가능한 호스트 없으므로 '-' 반환
        expect(result.firstHost, '-');
        expect(result.lastHost, '-');
      });

      test('/0 전체 인터넷 — 최대 범위', () {
        final result = SubnetCalculator.calculate('0.0.0.0', 0);

        expect(result, isNotNull);
        expect(result!.networkAddress, '0.0.0.0');
        expect(result.broadcastAddress, '255.255.255.255');
        expect(result.totalHosts, 4294967296); // 2^32
      });
    });

    // 잘못된 입력
    group('잘못된 입력', () {
      test('잘못된 IP 형식 — null 반환', () {
        expect(SubnetCalculator.calculate('192.168.1', 24), isNull);
        expect(SubnetCalculator.calculate('abc.def.ghi.jkl', 24), isNull);
        expect(SubnetCalculator.calculate('', 24), isNull);
      });

      test('옥텟이 255 초과 — null 반환', () {
        expect(SubnetCalculator.calculate('192.168.1.256', 24), isNull);
        expect(SubnetCalculator.calculate('999.0.0.0', 8), isNull);
      });

      test('prefix 범위 초과 — null 반환', () {
        expect(SubnetCalculator.calculate('192.168.1.0', -1), isNull);
        expect(SubnetCalculator.calculate('192.168.1.0', 33), isNull);
      });
    });
  });
}
