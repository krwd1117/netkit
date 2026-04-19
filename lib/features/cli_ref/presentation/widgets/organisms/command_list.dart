import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/cli_repository.dart';
import '../molecules/command_card.dart';

// 필터링된 명령어 목록 전체
class CommandList extends ConsumerWidget {
  final String vendor;
  final String category;
  final String query;

  const CommandList({
    super.key,
    required this.vendor,
    required this.category,
    required this.query,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commandsAsync = ref.watch(
      filteredCommandsProvider(
        vendor: vendor,
        category: category,
        query: query,
      ),
    );

    return commandsAsync.when(
      data: (commands) => commands.isEmpty
          ? const Center(child: Text('명령어가 없어요'))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: commands.length,
              itemBuilder: (_, i) => CommandCard(command: commands[i]),
            ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('오류: $e')),
    );
  }
}
