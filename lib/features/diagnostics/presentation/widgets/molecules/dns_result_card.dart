import 'package:flutter/material.dart';
import '../../../domain/dns_result.dart';
import '../atoms/result_item.dart';

// DNS Lookup 결과 카드
class DnsResultCard extends StatelessWidget {
  final DnsResult result;

  const DnsResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('조회 결과', style: Theme.of(context).textTheme.titleMedium),
            const Divider(),
            ResultItem(label: 'Host', value: result.host),
            ResultItem(
              label: '응답 시간',
              value: '${result.elapsed.inMilliseconds}ms',
            ),
            const SizedBox(height: 8),
            Text(
              'IP 주소',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 4),
            // IP 주소 목록
            ...result.addresses.map(
              (ip) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(ip, style: Theme.of(context).textTheme.labelLarge),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
