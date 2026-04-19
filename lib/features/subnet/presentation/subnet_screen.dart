import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/subnet_provider.dart';
import 'widgets/ip_text_field.dart';
import 'widgets/prefix_slider.dart';
import 'widgets/result_card.dart';

// 서브넷 계산기 메인 화면
// 각 위젯을 조합만 하는 역할 — 로직 없음
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

    return Scaffold(
      appBar: AppBar(title: const Text('Subnet Calculator')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IpTextField(controller: _ipController),
            const SizedBox(height: 16),
            PrefixSlider(prefix: prefix),
            const SizedBox(height: 24),
            if (result != null) ResultCard(result: result),
            if (result == null)
              const Center(
                child: Text(
                  'IP 주소를 입력하세요',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
