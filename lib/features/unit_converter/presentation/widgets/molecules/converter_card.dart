import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../application/converter_provider.dart';
import '../../../domain/unit_type.dart';
import '../atoms/unit_dropdown.dart';

class ConverterCard extends ConsumerWidget {
  const ConverterCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(selectedCategoryProvider);
    final fromUnit = ref.watch(fromUnitProvider);
    final toUnit = ref.watch(toUnitProvider);
    final result = ref.watch(conversionResultProvider);
    final units = unitsOf(category);
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
            // 입력값 필드
            TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                hintText: '값을 입력하세요',
                prefixIcon: Icon(Icons.edit_outlined),
              ),
              onChanged: (value) {
                ref.read(converterInputProvider.notifier).update(value);
              },
            ),
            const SizedBox(height: 16),

            // 입력 단위
            Text(
              '변환 전',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 8),
            UnitDropdown(
              units: units,
              selected: units.contains(fromUnit) ? fromUnit : units.first,
              onChanged: (unit) {
                if (unit != null) {
                  ref.read(fromUnitProvider.notifier).update(unit);
                }
              },
            ),
            const SizedBox(height: 16),

            // 출력 단위
            Text(
              '변환 후',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 8),
            UnitDropdown(
              units: units,
              selected: units.contains(toUnit) ? toUnit : units.last,
              onChanged: (unit) {
                if (unit != null) {
                  ref.read(toUnitProvider.notifier).update(unit);
                }
              },
            ),

            // 변환 결과
            if (result.isNotEmpty) ...[
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.infoBgDark : AppColors.infoBg,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: [
                    Text(
                      result,
                      style: const TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        letterSpacing: -0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      toUnit.label,
                      style: const TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
