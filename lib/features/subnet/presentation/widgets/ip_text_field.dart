import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/subnet_provider.dart';

// IP 주소 입력 필드 위젯
class IpTextField extends ConsumerWidget {
  final TextEditingController controller;

  const IpTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: controller,
      // 숫자와 점만 입력 가능하도록 제한
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'IP Address',
        hintText: '192.168.1.0',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.lan_outlined),
      ),
      onChanged: (value) {
        // 입력값이 바뀔 때마다 Provider 업데이트
        ref.read(ipInputProvider.notifier).update(value);
      },
    );
  }
}
