import 'package:flutter/material.dart';
import '../../domain/subnet_result.dart';
import 'result_row.dart';

// 서브넷 계산 결과 전체를 카드 형태로 표시하는 위젯
class ResultCard extends StatelessWidget {
  final SubnetResult result;

  const ResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('계산 결과', style: Theme.of(context).textTheme.titleMedium),
            const Divider(),
            ResultRow(label: 'Network', value: result.networkAddress),
            ResultRow(label: 'Broadcast', value: result.broadcastAddress),
            ResultRow(label: 'Subnet Mask', value: result.subnetMask),
            ResultRow(label: 'Wildcard', value: result.wildcardMask),
            ResultRow(label: 'First Host', value: result.firstHost),
            ResultRow(label: 'Last Host', value: result.lastHost),
            ResultRow(
              label: 'Total Hosts',
              value: result.totalHosts.toString(),
            ),
            ResultRow(
              label: 'Usable Hosts',
              value: result.usableHosts.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
