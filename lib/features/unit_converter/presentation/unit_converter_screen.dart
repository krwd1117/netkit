import 'package:flutter/material.dart';
import 'widgets/organisms/converter_panel.dart';

// 단위 변환기 메인 화면
class UnitConverterScreen extends StatelessWidget {
  const UnitConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unit Converter')),
      body: const SingleChildScrollView(child: ConverterPanel()),
    );
  }
}
