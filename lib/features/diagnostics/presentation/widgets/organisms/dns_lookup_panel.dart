import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/dns_service.dart';
import '../molecules/dns_result_card.dart';

// DNS Lookup 전체 패널
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
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 입력 필드 + 조회 버튼
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Host / Domain',
                    hintText: 'google.com',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.dns_outlined),
                  ),
                  onSubmitted: (value) => _lookup(value),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () => _lookup(_controller.text),
                child: const Text('조회'),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 결과 표시
          dnsState.when(
            data: (result) => result == null
                ? const Center(
                    child: Text(
                      '도메인을 입력하세요',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : DnsResultCard(result: result),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(
              child: Text(
                '조회 실패: $e',
                style: const TextStyle(color: Colors.red),
              ),
            ),
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
