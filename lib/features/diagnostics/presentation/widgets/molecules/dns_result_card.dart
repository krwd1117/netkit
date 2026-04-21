import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../domain/dns_result.dart';
import '../atoms/result_item.dart';

class DnsResultCard extends StatelessWidget {
  final DnsResult result;

  const DnsResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final codeBg = isDark ? AppColors.codeBgDark : AppColors.codeBgLight;
    final secondaryColor = isDark
        ? AppColors.textSecondaryDark
        : AppColors.textSecondaryLight;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('조회 결과', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 16),
            ResultItem(label: 'Host', value: result.host),
            ResultItem(
              label: '응답 시간',
              value: '${result.elapsed.inMilliseconds}ms',
            ),
            const SizedBox(height: 8),
            Text(
              'IP 주소',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: secondaryColor,
              ),
            ),
            const SizedBox(height: 8),
            ...result.addresses.map(
              (ip) => Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 6),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: codeBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  ip,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
