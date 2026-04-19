import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/cli_repository.dart';
import '../../../domain/cli_command.dart';

// 명령어 하나를 카드 형태로 표시
class CommandCard extends ConsumerWidget {
  final CliCommand command;

  const CommandCard({super.key, required this.command});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteIds = ref.watch(favoriteIdsProvider);
    final isFavorite = favoriteIds.contains(command.id);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 명령어 제목
                Expanded(
                  child: Text(
                    command.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                // 즐겨찾기 버튼
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.star : Icons.star_border,
                    color: isFavorite ? Colors.amber : Colors.grey,
                  ),
                  onPressed: () {
                    ref.read(favoriteIdsProvider.notifier).toggle(command.id);
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),

            // 명령어 — 탭하면 클립보드 복사
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
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  command.command,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // 명령어 설명
            Text(
              command.description,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
