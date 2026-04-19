import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/cli_repository.dart';
import '../atoms/command_chip.dart';

// 카테고리 칩 목록
class CategoryChipList extends ConsumerWidget {
  final String vendor;
  final String? selectedCategory;
  final ValueChanged<String?> onSelected;

  const CategoryChipList({
    super.key,
    required this.vendor,
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider(vendor));

    return categoriesAsync.when(
      data: (categories) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: categories.map((category) {
            final isSelected = selectedCategory == category;
            return CommandChip(
              label: category,
              isSelected: isSelected,
              onTap: () => onSelected(isSelected ? null : category),
            );
          }).toList(),
        ),
      ),
      loading: () => const LinearProgressIndicator(),
      error: (e, _) => Text('오류: $e'),
    );
  }
}
