import 'package:flutter/material.dart';
import 'widgets/organisms/dns_lookup_panel.dart';
import 'widgets/organisms/ping_panel.dart';

class DiagnosticsScreen extends StatefulWidget {
  const DiagnosticsScreen({super.key});

  @override
  State<DiagnosticsScreen> createState() => _DiagnosticsScreenState();
}

class _DiagnosticsScreenState extends State<DiagnosticsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnostics'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'DNS'),
            Tab(text: 'Ping'),
            Tab(text: 'Port'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          DnsLookupPanel(),
          PingPanel(),
          Center(child: Text('Port Scanner — 준비 중')),
        ],
      ),
    );
  }
}
