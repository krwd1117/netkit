import 'package:flutter/material.dart';
import 'widgets/organisms/converter_panel.dart';

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
