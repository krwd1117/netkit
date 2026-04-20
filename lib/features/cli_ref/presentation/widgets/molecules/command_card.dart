import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../application/cli_repository.dart';
import '../../../domain/cli_command.dart';

class CommandCard extends ConsumerWidget {
  final CliCommand command;

  const CommandCard({super.key, required this.command});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteIds = ref.watch(favoriteIdsProvider);
    final isFavorite = favoriteIds.contains(command.id);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final codeBg = isDark ? AppColors.codeBgDark : AppColors.codeBgLight;
    final secondaryColor = isDark
        ? AppColors.textSecondaryDark
        : AppColors.textSecondaryLight;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    command.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ref.read(favoriteIdsProvider.notifier).toggle(command.id);
                  },
                  child: Icon(
                    isFavorite ? Icons.star_rounded : Icons.star_outline_rounded,
                    color: isFavorite ? AppColors.warning : secondaryColor,
                    size: 22,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // 명령어 코드 블록 — 탭하면 클립보드 복사
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: command.command));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('명령어가 복사됐어요'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: codeBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        command.command,
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.copy_rounded,
                      size: 14,
                      color: secondaryColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),

            Text(
              command.description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
