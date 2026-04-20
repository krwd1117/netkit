// 포트 스캔 결과 데이터 모델
class PortResult {
  final int port; // 스캔한 포트 번호
  final bool isOpen; // 열려있는지 여부
  final String service; // 포트에 해당하는 서비스 이름

  const PortResult({
    required this.port,
    required this.isOpen,
    required this.service,
  });
}

// 포트 스캔 전체 결과
class PortScanResult {
  final String host; // 대상 호스트
  final String ip; // 해석된 IP
  final List<PortResult> ports; // 스캔한 포트 목록

  const PortScanResult({
    required this.host,
    required this.ip,
    required this.ports,
  });

  // 열린 포트만 필터링
  List<PortResult> get openPorts => ports.where((e) => e.isOpen).toList();
}
