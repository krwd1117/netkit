import 'package:flutter/material.dart';

class DiagnosticsScreen extends StatelessWidget {
  const DiagnosticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Diagnostics')),
      body: Center(child: Text('Diagnostics Screen')),
    );
  }
}
