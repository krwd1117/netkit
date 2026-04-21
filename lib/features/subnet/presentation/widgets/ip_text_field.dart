import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/subnet_provider.dart';

class IpTextField extends ConsumerWidget {
  final TextEditingController controller;

  const IpTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: controller,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'IP Address',
        hintText: '192.168.1.0',
        prefixIcon: Icon(Icons.lan_outlined),
      ),
      onChanged: (value) {
        ref.read(ipInputProvider.notifier).update(value);
      },
    );
  }
}
