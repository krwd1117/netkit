import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/molecules/vendor_chip_list.dart';
import 'widgets/molecules/category_chip_list.dart';
import 'widgets/molecules/search_field.dart';
import 'widgets/organisms/command_list.dart';

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
          SearchField(
            controller: _searchController,
            onChanged: (value) => setState(() => _query = value),
          ),
          const SizedBox(height: 4),
          VendorChipList(
            selectedVendor: _selectedVendor,
            onSelected: (vendor) => setState(() {
              _selectedVendor = vendor;
              _selectedCategory = null;
            }),
          ),
          if (_selectedVendor != null) ...[
            const SizedBox(height: 8),
            CategoryChipList(
              vendor: _selectedVendor!,
              selectedCategory: _selectedCategory,
              onSelected: (category) => setState(() {
                _selectedCategory = category;
              }),
            ),
          ],
          const SizedBox(height: 8),
          Expanded(
            child: _selectedVendor == null || _selectedCategory == null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.terminal_outlined,
                          size: 44,
                          color: Theme.of(context).colorScheme.outlineVariant,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _selectedVendor == null
                              ? '벤더를 선택하세요'
                              : '카테고리를 선택하세요',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ],
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
