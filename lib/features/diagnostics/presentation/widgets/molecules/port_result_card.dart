import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../domain/port_result.dart';

class PortResultCard extends StatelessWidget {
  final PortScanResult result;

  const PortResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
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
            Text('스캔 결과', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 16),
            _InfoRow(label: 'Host', value: result.host, secondary: secondaryColor),
            const SizedBox(height: 4),
            _InfoRow(label: 'IP', value: result.ip, secondary: secondaryColor),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  '열린 포트',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: secondaryColor,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.infoBg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${result.openPorts.length}',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            if (result.openPorts.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  '열린 포트가 없어요',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: secondaryColor,
                  ),
                ),
              )
            else
              ...result.openPorts.map(
                (port) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.success,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${port.port}',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        port.service,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: secondaryColor,
                        ),
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

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color secondary;

  const _InfoRow({
    required this.label,
    required this.value,
    required this.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: secondary,
          ),
        ),
        Text(value, style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }
}
