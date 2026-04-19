// DNS Lookup 결과 데이터 모델
class DnsResult {
  final String host; // 조회한 호스트명
  final List<String> addresses; // 반환된 IP 주소 목록
  final Duration elapsed; // 조회 소요 시간

  const DnsResult({
    required this.host,
    required this.addresses,
    required this.elapsed,
  });
}
