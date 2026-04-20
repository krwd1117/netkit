import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../application/subnet_provider.dart';
import 'widgets/ip_text_field.dart';
import 'widgets/prefix_slider.dart';
import 'widgets/result_card.dart';

class SubnetScreen extends ConsumerStatefulWidget {
  const SubnetScreen({super.key});

  @override
  ConsumerState<SubnetScreen> createState() => _SubnetScreenState();
}

class _SubnetScreenState extends ConsumerState<SubnetScreen> {
  final _ipController = TextEditingController();

  @override
  void dispose() {
    _ipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prefix = ref.watch(prefixInputProvider);
    final result = ref.watch(subnetResultProvider);
    final ipInput = ref.watch(ipInputProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Subnet Calculator')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            IpTextField(controller: _ipController),
            const SizedBox(height: 16),
            PrefixSlider(prefix: prefix),
            const SizedBox(height: 24),

            if (result != null) ResultCard(result: result),

            if (result == null && ipInput.isEmpty)
              _EmptyState(
                icon: Icons.lan_outlined,
                message: 'IP 주소를 입력하세요',
              ),

            if (result == null && ipInput.isNotEmpty)
              _EmptyState(
                icon: Icons.error_outline_rounded,
                message: '올바른 IP 주소를 입력하세요',
                isError: true,
              ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String message;
  final bool isError;

  const _EmptyState({
    required this.icon,
    required this.message,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isError ? AppColors.error : AppColors.textSecondaryLight;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Center(
        child: Column(
          children: [
            Icon(icon, size: 44, color: color.withValues(alpha: 0.4)),
            const SizedBox(height: 12),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
