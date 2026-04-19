import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/subnet_provider.dart';

// Prefix 슬라이더 위젯
// Riverpod을 직접 읽고 써야 하므로 ConsumerWidget 사용
class PrefixSlider extends ConsumerWidget {
  final int prefix;

  const PrefixSlider({super.key, required this.prefix});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 현재 prefix 값 표시
        Text(
          'Prefix  /$prefix',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Slider(
          value: prefix.toDouble(),
          min: 0,
          max: 32,
          divisions: 32,
          label: '/$prefix',
          onChanged: (value) {
            // 슬라이더 값이 바뀔 때마다 Provider 업데이트
            ref.read(prefixInputProvider.notifier).update(value.toInt());
          },
        ),
      ],
    );
  }
}
