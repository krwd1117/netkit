import 'package:flutter/material.dart';
import '../../../domain/ping_result.dart';
import '../atoms/result_item.dart';

// Ping 결과 카드
class PingResultCard extends StatelessWidget {
  final PingResult result;

  const PingResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // 응답 여부 아이콘
                Icon(
                  result.isReachable ? Icons.check_circle : Icons.cancel,
                  color: result.isReachable ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 8),
                Text(
                  result.isReachable ? '응답 있음' : '응답 없음',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: result.isReachable ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
            const Divider(),
            ResultItem(label: 'Host', value: result.host),
            ResultItem(label: 'IP', value: result.ip),
            ResultItem(
              label: '응답 시간',
              value: '${result.elapsed.inMilliseconds}ms',
            ),
          ],
        ),
      ),
    );
  }
}
