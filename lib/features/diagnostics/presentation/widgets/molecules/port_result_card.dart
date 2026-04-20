import 'package:flutter/material.dart';
import '../../../domain/port_result.dart';

// 포트 스캔 결과 카드
class PortResultCard extends StatelessWidget {
  final PortScanResult result;

  const PortResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 호스트 정보
            Text('스캔 결과', style: Theme.of(context).textTheme.titleMedium),
            const Divider(),
            Text(
              'Host: ${result.host}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'IP: ${result.ip}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            Text(
              '열린 포트 ${result.openPorts.length}개',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 8),

            // 포트 목록 — 열린 포트만 표시
            if (result.openPorts.isEmpty)
              const Text('열린 포트가 없어요', style: TextStyle(color: Colors.grey))
            else
              ...result.openPorts.map(
                (port) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      // 열린 포트 아이콘
                      const Icon(Icons.circle, size: 8, color: Colors.green),
                      const SizedBox(width: 8),
                      // 포트 번호
                      Text(
                        '${port.port}',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(width: 8),
                      // 서비스 이름
                      Text(
                        port.service,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
