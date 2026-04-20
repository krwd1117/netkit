import 'package:flutter/material.dart';
import '../../../domain/unit_type.dart';

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
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      items: units.map((unit) {
        return DropdownMenuItem(
          value: unit,
          child: Text(
            unit.label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
