import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/ping_service.dart';
import '../molecules/ping_result_card.dart';

// Ping 전체 패널
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
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 입력 필드 + Ping 버튼
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Host / IP',
                    hintText: '8.8.8.8 또는 google.com',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.network_ping_outlined),
                  ),
                  onSubmitted: (value) => _ping(value),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () => _ping(_controller.text),
                child: const Text('Ping'),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 결과 표시
          pingState.when(
            data: (result) => result == null
                ? const Center(
                    child: Text(
                      'Host 또는 IP를 입력하세요',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : PingResultCard(result: result),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(
              child: Text('오류: $e', style: const TextStyle(color: Colors.red)),
            ),
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
