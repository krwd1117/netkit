class CliCommand {
  final int id;
  final String vendor; // 벤더 (Cisco, Juniper 등)
  final String category; // 카테고리 (Interface, VLAN 등)
  final String title; // 명령어 제목
  final String command; // 실제 명령어
  final String description; // 명령어 설명

  CliCommand({
    required this.id,
    required this.vendor,
    required this.category,
    required this.title,
    required this.command,
    required this.description,
  });

  factory CliCommand.fromJson(Map<String, dynamic> json) {
    return CliCommand(
      id: json['id'] as int,
      vendor: json['vendor'] as String,
      category: json['category'] as String,
      title: json['title'] as String,
      command: json['command'] as String,
      description: json['description'] as String,
    );
  }
}
