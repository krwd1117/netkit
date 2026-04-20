import 'package:flutter/material.dart';
import '../../../domain/unit_type.dart';

// 단위 선택 드롭다운
class UnitDropdown extends StatelessWidget {
  final List<UnitDefinition> units;
  final UnitDefinition selected;
  final ValueChanged<UnitDefinition?> onChanged;

  const UnitDropdown({
    super.key,
    required this.units,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<UnitDefinition>(
      value: selected,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      items: units.map((unit) {
        return DropdownMenuItem(
          value: unit,
          child: Text(
            unit.label,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
