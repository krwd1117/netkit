import 'package:flutter/material.dart';

// 결과 한 줄을 표시하는 가장 작은 단위 위젯
class ResultRow extends StatelessWidget {
  final String label;
  final String value;

  const ResultRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 라벨 — 보조 텍스트 색상
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
          ),
          // 값 — 모노스페이스 폰트 (IP 주소 표시용)
          Text(value, style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
    );
  }
}
