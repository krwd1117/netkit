import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../domain/ping_result.dart';
import '../atoms/result_item.dart';

class PingResultCard extends StatelessWidget {
  final PingResult result;

  const PingResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final statusColor = result.isReachable ? AppColors.success : AppColors.error;
    final statusBg = result.isReachable
        ? (isDark ? AppColors.successBgDark : AppColors.successBg)
        : (isDark ? AppColors.errorBgDark : AppColors.errorBg);

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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: statusBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    result.isReachable
                        ? Icons.check_circle_rounded
                        : Icons.cancel_rounded,
                    color: statusColor,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    result.isReachable ? '응답 있음' : '응답 없음',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: statusColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
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
