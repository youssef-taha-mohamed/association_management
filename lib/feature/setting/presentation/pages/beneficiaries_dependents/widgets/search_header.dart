import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import '../../../../../../core/style/app_colors.dart';
import '../../../../../../shared/widgets/main_textfield.dart';
import '../beneficiaries_dep.dart';

class SearchAndStatsWidgets extends StatelessWidget {
  const SearchAndStatsWidgets({
    required this.searchController,
    super.key,
    required this.beneficiaries,
    this.onChanged,
  });

  final TextEditingController searchController;
  final List<Beneficiary> beneficiaries;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          MainTextField(
            controller: searchController,
            hint: context.l10n.search_beneficiaries,
            prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
            // suffixIcon:
            //     searchController.text.isNotEmpty
            //         ? IconButton(
            //           icon: Icon(Icons.clear),
            //           onPressed: () {
            //             searchController.clear();
            //             setState(() {});
            //           },
            //         )
            //         : null,
            onChanged: onChanged,
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context.l10n.total,
                  beneficiaries.length.toString(),
                  Icons.people,
                  AppColors.blue,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context.l10n.active,
                  beneficiaries
                      .where((b) => b.status == 'Active')
                      .length
                      .toString(),
                  Icons.check_circle,
                  AppColors.green,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context.l10n.pending,
                  beneficiaries
                      .where((b) => b.status == 'Pending')
                      .length
                      .toString(),
                  Icons.pending,
                  Colors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
