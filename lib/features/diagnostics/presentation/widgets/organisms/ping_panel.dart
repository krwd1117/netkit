import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../application/ping_service.dart';
import '../molecules/ping_result_card.dart';

class PingPanel extends ConsumerStatefulWidget {
  const PingPanel({super.key});

  @override
  ConsumerState<PingPanel> createState() => _PingPanelState();
}

class _PingPanelState extends ConsumerState<PingPanel> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pingState = ref.watch(pingLookupProvider);

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
                    hintText: '8.8.8.8 or google.com',
                    prefixIcon: Icon(Icons.network_ping_outlined),
                  ),
                  onSubmitted: (value) => _ping(value),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () => _ping(_controller.text),
                child: const Text('Ping'),
              ),
            ],
          ),
          const SizedBox(height: 24),

          pingState.when(
            data: (result) => result == null
                ? _emptyState(context)
                : PingResultCard(result: result),
            loading: () => const Expanded(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, _) => _errorState(context, '오류: $e'),
          ),
        ],
      ),
    );
  }

  Widget _emptyState(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.network_ping_outlined,
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
      ),
    );
  }

  Widget _errorState(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline_rounded, size: 40, color: AppColors.error),
          const SizedBox(height: 12),
          Text(
            message,
            style: const TextStyle(color: AppColors.error),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _ping(String host) {
    if (host.isEmpty) return;
    ref.read(pingLookupProvider.notifier).ping(host);
  }
}
