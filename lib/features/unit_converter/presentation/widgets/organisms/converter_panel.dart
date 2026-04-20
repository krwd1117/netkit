import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../application/converter_provider.dart';
import '../../../domain/unit_type.dart';
import '../molecules/converter_card.dart';

class ConverterPanel extends ConsumerWidget {
  const ConverterPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(selectedCategoryProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          // 카테고리 선택 — 토스 스타일 세그먼트
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.inputFillLight,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: UnitCategory.values.map((cat) {
                final isSelected = cat == category;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      ref.read(selectedCategoryProvider.notifier).update(cat);
                      final units = unitsOf(cat);
                      ref.read(fromUnitProvider.notifier).update(units.first);
                      ref.read(toUnitProvider.notifier).update(units.last);
                      ref.read(converterInputProvider.notifier).update('');
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.08),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : null,
                      ),
                      child: Column(
                        children: [
                          Icon(
                            _iconOf(cat),
                            size: 18,
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.textSecondaryLight,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _labelOf(cat),
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontSize: 12,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.textSecondaryLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),
          const ConverterCard(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  IconData _iconOf(UnitCategory cat) {
    switch (cat) {
      case UnitCategory.bandwidth:
        return Icons.network_check_outlined;
      case UnitCategory.dataSize:
        return Icons.storage_outlined;
      case UnitCategory.time:
        return Icons.timer_outlined;
    }
  }

  String _labelOf(UnitCategory cat) {
    switch (cat) {
      case UnitCategory.bandwidth:
        return '대역폭';
      case UnitCategory.dataSize:
        return '데이터';
      case UnitCategory.time:
        return '시간';
    }
  }
}
