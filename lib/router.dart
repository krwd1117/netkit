import 'package:flutter/material.dart';
import 'features/subnet/presentation/subnet_screen.dart';
import 'features/cli_ref/presentation/cli_ref_screen.dart';
import 'features/diagnostics/presentation/diagnostics_screen.dart';
import 'features/unit_converter/presentation/unit_converter_screen.dart';

// 하단 탭 네비게이션을 관리하는 메인 껍데기 위젯
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  // 현재 선택된 탭 인덱스
  // 0 = 서브넷, 1 = CLI 참조, 2 = 진단, 3 = 단위 변환
  int _currentIndex = 0;

  // 탭별 화면 리스트
  final List<Widget> _screens = const [
    SubnetScreen(),
    CliRefScreen(),
    DiagnosticsScreen(),
    UnitConverterScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 현재 선택된 탭의 화면 표시
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (idx) {
          setState(() {
            _currentIndex = idx;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.calculate_outlined),
            selectedIcon: Icon(Icons.calculate),
            label: 'Subnet',
          ),
          NavigationDestination(
            icon: Icon(Icons.terminal_outlined),
            selectedIcon: Icon(Icons.terminal),
            label: 'CLI Ref',
          ),
          NavigationDestination(
            icon: Icon(Icons.network_check_outlined),
            selectedIcon: Icon(Icons.network_check),
            label: 'Diagnose',
          ),
          NavigationDestination(
            icon: Icon(Icons.swap_horiz_outlined),
            selectedIcon: Icon(Icons.swap_horiz),
            label: 'Converter',
          ),
        ],
      ),
    );
  }
}
