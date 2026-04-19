import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/molecules/vendor_chip_list.dart';
import 'widgets/molecules/category_chip_list.dart';
import 'widgets/molecules/search_field.dart';
import 'widgets/organisms/command_list.dart';

// CLI 레퍼런스 메인 화면
class CliRefScreen extends ConsumerStatefulWidget {
  const CliRefScreen({super.key});

  @override
  ConsumerState<CliRefScreen> createState() => _CliRefScreenState();
}

class _CliRefScreenState extends ConsumerState<CliRefScreen> {
  String? _selectedVendor;
  String? _selectedCategory;
  String _query = '';
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CLI Reference')),
      body: Column(
        children: [
          // 검색 필드
          SearchField(
            controller: _searchController,
            onChanged: (value) => setState(() => _query = value),
          ),

          // 벤더 선택
          VendorChipList(
            selectedVendor: _selectedVendor,
            onSelected: (vendor) => setState(() {
              _selectedVendor = vendor;
              _selectedCategory = null;
            }),
          ),
          const SizedBox(height: 8),

          // 카테고리 선택
          if (_selectedVendor != null)
            CategoryChipList(
              vendor: _selectedVendor!,
              selectedCategory: _selectedCategory,
              onSelected: (category) => setState(() {
                _selectedCategory = category;
              }),
            ),
          const SizedBox(height: 8),

          // 명령어 목록
          Expanded(
            child: _selectedVendor == null || _selectedCategory == null
                ? const Center(
                    child: Text(
                      '벤더와 카테고리를 선택하세요',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : CommandList(
                    vendor: _selectedVendor!,
                    category: _selectedCategory!,
                    query: _query,
                  ),
          ),
        ],
      ),
    );
  }
}
