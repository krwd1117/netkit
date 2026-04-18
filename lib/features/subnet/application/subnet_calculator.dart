import '../domain/subnet_result.dart';

// 서브넷 계산 로직
class SubnetCalculator {
  SubnetCalculator._();

  // 메인 계산 메서드
  // ip: "192.168.1.0" 형태, prefix: 24 형태로 받음
  // 실패시 null 반환
  static SubnetResult? calculate(String ip, int prefix) {
    // prefix 범위 검증 (0~32)
    if (prefix < 0 || prefix > 32) return null;

    // IP 주소를 4개의 옥텟으로 분리
    final octets = ip.split('.');
    if (octets.length != 4) return null;

    // 각 옥텟을 정수로 변환
    // tryParse 실패 시 null 반환
    final ipInt = _ipToInt(ip);
    if (ipInt == null) return null;

    // prefix로 서브넷 마스크 계산
    // 예: /24 → 0xFFFFFF00 (32비트 정수)
    final mask = prefix == 0 ? 0 : (0xFFFFFFFF << (32 - prefix)) & 0xFFFFFFFF;

    // 네트워크 주소 = IP AND 마스크
    final network = ipInt & mask;

    // 브로드캐스트 = 네트워크 OR (마스크 반전)
    final broadcast = network | (~mask & 0xFFFFFFFF);

    // 전체 호스트 수 = 2^(32 - prefix)
    final total = 1 << (32 - prefix);

    // 사용 가능한 호스트 = 전체 - 2 (네트워크 주소 + 브로드캐스트)
    final usable = total > 2 ? total - 2 : 0;

    return SubnetResult(
      networkAddress: _intToIp(network),
      broadcastAddress: _intToIp(broadcast),
      subnetMask: _intToIp(mask),
      wildcardMask: _intToIp(~mask & 0xFFFFFFFF), // 마스크 비트 반전
      firstHost: usable > 0 ? _intToIp(network + 1) : '-',
      lastHost: usable > 0 ? _intToIp(broadcast - 1) : '-',
      totalHosts: total,
      usableHosts: usable,
      prefix: prefix,
    );
  }

  // IP 문자열 → 32비트 정수 변환
  // 예: "192.168.1.0" → 3232235776
  static int? _ipToInt(String ip) {
    final parts = ip.split('.');
    if (parts.length != 4) return null;

    int result = 0;
    for (final part in parts) {
      final octet = int.tryParse(part);
      // 각 옥텟은 0~255 범위여야 함
      if (octet == null || octet < 0 || octet > 255) return null;
      result = (result << 8) | octet; // 8비트씩 왼쪽으로 shift 후 OR
    }
    return result;
  }

  // 32비트 정수 → IP 문자열 변환
  // 예: 3232235776 → "192.168.1.0"
  static String _intToIp(int ip) {
    return [
      (ip >> 24) & 0xFF, // 첫 번째 옥텟
      (ip >> 16) & 0xFF, // 두 번째 옥텟
      (ip >> 8) & 0xFF, // 세 번째 옥텟
      ip & 0xFF, // 네 번째 옥텟
    ].join('.');
  }
}
