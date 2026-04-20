import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/converter_provider.dart';
import '../../../domain/unit_type.dart';
import '../atoms/unit_dropdown.dart';

// 변환 입력 + 결과 카드
class ConverterCard extends ConsumerWidget {
  const ConverterCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(selectedCategoryProvider);
    final fromUnit = ref.watch(fromUnitProvider);
    final toUnit = ref.watch(toUnitProvider);
    final result = ref.watch(conversionResultProvider);
    final units = unitsOf(category);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 입력값 필드
            TextField(
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: '입력값',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                ref.read(converterInputProvider.notifier).update(value);
              },
            ),
            const SizedBox(height: 12),

            // 입력 단위 선택
            Text(
              '변환 전',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 4),
            UnitDropdown(
              units: units,
              selected: units.contains(fromUnit) ? fromUnit : units.first,
              onChanged: (unit) {
                if (unit != null) {
                  ref.read(fromUnitProvider.notifier).update(unit);
                }
              },
            ),
            const SizedBox(height: 12),

            // 출력 단위 선택
            Text(
              '변환 후',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 4),
            UnitDropdown(
              units: units,
              selected: units.contains(toUnit) ? toUnit : units.last,
              onChanged: (unit) {
                if (unit != null) {
                  ref.read(toUnitProvider.notifier).update(unit);
                }
              },
            ),
            const SizedBox(height: 16),

            // 변환 결과
            if (result.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${result} ${toUnit.label}',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
