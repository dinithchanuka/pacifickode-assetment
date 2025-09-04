import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/searchType.dart';
import '../providers/job_providers.dart';

class SearchTextField extends ConsumerStatefulWidget {
  final String hintText;
  final SearchType searchType;

  const SearchTextField({
    super.key,
    required this.hintText,
    required this.searchType,
  });

  @override
  ConsumerState<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends ConsumerState<SearchTextField> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: TextFormField(
        controller: _searchController,
        onChanged: (query) {
          if (widget.searchType == SearchType.byTitle) {
            ref
                .read(jobNotifierProvider.notifier)
                .updateSearchQueryTitle(query);
          }
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: Icon(Icons.search),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    if (widget.searchType == SearchType.byTitle) {
                      ref
                          .read(jobNotifierProvider.notifier)
                          .updateSearchQueryTitle('');
                    }
                    setState(() {});
                  },
                )
              : null,
        ),
      ),
    );
  }
}
