import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../application/dns_service.dart';
import '../molecules/dns_result_card.dart';

class DnsLookupPanel extends ConsumerStatefulWidget {
  const DnsLookupPanel({super.key});

  @override
  ConsumerState<DnsLookupPanel> createState() => _DnsLookupPanelState();
}

class _DnsLookupPanelState extends ConsumerState<DnsLookupPanel> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dnsState = ref.watch(dnsLookupProvider);

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
                    hintText: 'google.com',
                    prefixIcon: Icon(Icons.dns_outlined),
                  ),
                  onSubmitted: (value) => _lookup(value),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () => _lookup(_controller.text),
                child: const Text('Lookup'),
              ),
            ],
          ),
          const SizedBox(height: 24),

          dnsState.when(
            data: (result) => result == null
                ? _emptyState(context)
                : DnsResultCard(result: result),
            loading: () => const Expanded(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, _) => _errorState(context, '조회 실패: $e'),
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
              Icons.dns_outlined,
              size: 44,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            const SizedBox(height: 12),
            Text(
              '도메인을 입력하세요',
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

  void _lookup(String host) {
    if (host.isEmpty) return;
    ref.read(dnsLookupProvider.notifier).lookup(host);
  }
}
