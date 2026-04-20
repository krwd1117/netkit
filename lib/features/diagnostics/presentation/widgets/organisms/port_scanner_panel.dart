import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../application/port_scanner_service.dart';
import '../molecules/port_result_card.dart';

class PortScannerPanel extends ConsumerStatefulWidget {
  const PortScannerPanel({super.key});

  @override
  ConsumerState<PortScannerPanel> createState() => _PortScannerPanelState();
}

class _PortScannerPanelState extends ConsumerState<PortScannerPanel> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scanState = ref.watch(portScanProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: '192.168.1.1 or google.com',
                    prefixIcon: Icon(Icons.radar_outlined),
                  ),
                  onSubmitted: (value) => _scan(value),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () => _scan(_controller.text),
                child: const Text('Scan'),
              ),
            ],
          ),
          const SizedBox(height: 24),

          Expanded(
            child: scanState.when(
              data: (result) => result == null
                  ? _emptyState(context)
                  : SingleChildScrollView(
                      child: PortResultCard(result: result),
                    ),
              loading: () => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 16),
                    Text(
                      '포트 스캔 중...',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
              error: (e, _) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline_rounded, size: 40, color: AppColors.error),
                    const SizedBox(height: 12),
                    Text(
                      '오류: $e',
                      style: const TextStyle(color: AppColors.error),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.radar_outlined,
            size: 44,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
          const SizedBox(height: 12),
          Text(
            'Host 또는 IP를 입력하세요',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }

  void _scan(String host) {
    if (host.isEmpty) return;
    ref.read(portScanProvider.notifier).scan(host);
  }
}
