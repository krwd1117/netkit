import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/cli_repository.dart';
import '../atoms/command_chip.dart';

// 벤더 칩 목록
class VendorChipList extends ConsumerWidget {
  final String? selectedVendor;
  final ValueChanged<String?> onSelected;

  const VendorChipList({
    super.key,
    required this.selectedVendor,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendorsAsync = ref.watch(vendorsProvider);

    return vendorsAsync.when(
      data: (vendors) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: vendors.map((vendor) {
            final isSelected = selectedVendor == vendor;
            return CommandChip(
              label: vendor,
              isSelected: isSelected,
              onTap: () => onSelected(isSelected ? null : vendor),
            );
          }).toList(),
        ),
      ),
      loading: () => const LinearProgressIndicator(),
      error: (e, _) => Text('오류: $e'),
    );
  }
}
