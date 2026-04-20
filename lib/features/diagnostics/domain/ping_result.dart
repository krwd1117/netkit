// Ping 결과 데이터 모델
class PingResult {
  final String host; // 대상 호스트
  final String ip; // 해석된 IP 주소
  final Duration elapsed; // 응답 시간
  final bool isReachable; // 응답 여부

  const PingResult({
    required this.host,
    required this.ip,
    required this.elapsed,
    required this.isReachable,
  });
}
