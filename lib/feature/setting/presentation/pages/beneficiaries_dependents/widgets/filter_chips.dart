import 'package:flutter/material.dart';
import 'package:management/shared/widgets/main_text.dart';

import '../../../../../../core/style/app_colors.dart';

class FilterChipsWidgets extends StatefulWidget {
  final List<String> categories;
  String selectedCategory;

  FilterChipsWidgets({
    super.key,
    required this.categories,
    required this.selectedCategory,
  });

  @override
  State<FilterChipsWidgets> createState() => _FilterChipsWidgetsState();
}

class _FilterChipsWidgetsState extends State<FilterChipsWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    widget.categories.map((category) {
                      final isSelected = widget.selectedCategory == category;
                      return Container(
                        margin: EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: MainText(category),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              widget.selectedCategory = category;
                            });
                          },
                          backgroundColor: Colors.grey.shade100,
                          selectedColor: Colors.blue.shade100,
                          checkmarkColor: Colors.blue.shade600,
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
