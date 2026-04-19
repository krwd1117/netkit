import 'package:flutter/material.dart';

// 결과 한 줄 표시 — 진단 도구 공통으로 재사용
class ResultItem extends StatelessWidget {
  final String label;
  final String value;

  const ResultItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
          ),
          Text(value, style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
    );
  }
}
