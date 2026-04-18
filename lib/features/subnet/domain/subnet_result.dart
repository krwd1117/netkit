class SubnetResult {
  final String networkAddress; // 네트워크 주소 (예: 192.168.1.0)
  final String broadcastAddress; // 브로드캐스트 주소 (예: 192.168.1.255)
  final String subnetMask; // 서브넷 마스크 (예: 255.255.255.0)
  final String wildcardMask; // 와일드카드 마스크 (예: 0.0.0.255)
  final String firstHost; // 첫 번째 사용 가능한 호스트 IP
  final String lastHost; // 마지막 사용 가능한 호스트 IP
  final int totalHosts; // 전체 호스트 수 (브로드캐스트 포함)
  final int usableHosts; // 실제 사용 가능한 호스트 수
  final int prefix; // prefix 길이 (예: 24)

  const SubnetResult({
    required this.networkAddress,
    required this.broadcastAddress,
    required this.subnetMask,
    required this.wildcardMask,
    required this.firstHost,
    required this.lastHost,
    required this.totalHosts,
    required this.usableHosts,
    required this.prefix,
  });
}
