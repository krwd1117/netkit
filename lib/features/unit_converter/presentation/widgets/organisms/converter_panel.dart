import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/converter_provider.dart';
import '../../../domain/unit_type.dart';
import '../molecules/converter_card.dart';

// 단위 변환기 전체 패널
class ConverterPanel extends ConsumerWidget {
  const ConverterPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(selectedCategoryProvider);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 카테고리 선택 탭
          SegmentedButton<UnitCategory>(
            segments: const [
              ButtonSegment(
                value: UnitCategory.bandwidth,
                label: Text('대역폭'),
                icon: Icon(Icons.network_check_outlined),
              ),
              ButtonSegment(
                value: UnitCategory.dataSize,
                label: Text('데이터'),
                icon: Icon(Icons.storage_outlined),
              ),
              ButtonSegment(
                value: UnitCategory.time,
                label: Text('시간'),
                icon: Icon(Icons.timer_outlined),
              ),
            ],
            selected: {category},
            onSelectionChanged: (selected) {
              final newCategory = selected.first;
              ref.read(selectedCategoryProvider.notifier).update(newCategory);

              // 카테고리 변경 시 단위 초기화
              final units = unitsOf(newCategory);
              ref.read(fromUnitProvider.notifier).update(units.first);
              ref.read(toUnitProvider.notifier).update(units.last);
              ref.read(converterInputProvider.notifier).update('');
            },
          ),
          const SizedBox(height: 16),

          // 변환 카드
          const ConverterCard(),
        ],
      ),
    );
  }
}
