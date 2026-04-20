import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/port_scanner_service.dart';
import '../molecules/port_result_card.dart';

// Port Scanner 전체 패널
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
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 입력 필드 + 스캔 버튼
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Host / IP',
                    hintText: '192.168.1.1 또는 google.com',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.radar_outlined),
                  ),
                  onSubmitted: (value) => _scan(value),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () => _scan(_controller.text),
                child: const Text('스캔'),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 결과 표시
          Expanded(
            child: scanState.when(
              data: (result) => result == null
                  ? const Center(
                      child: Text(
                        'Host 또는 IP를 입력하세요',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : SingleChildScrollView(
                      child: PortResultCard(result: result),
                    ),
              loading: () => const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('포트 스캔 중...', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              error: (e, _) => Center(
                child: Text(
                  '오류: $e',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
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
