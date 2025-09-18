import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../shared/widgets/main_text.dart';
import 'add_beneficiary.dart';
import 'widgets/beneficiary_car.dart';
import 'widgets/search_header.dart';

class BeneficiariesDepPage extends StatefulWidget {
  static const String routeName = 'beneficiaries_dep';

  const BeneficiariesDepPage({super.key});

  @override
  State<BeneficiariesDepPage> createState() => _BeneficiariesDepPageState();
}

class _BeneficiariesDepPageState extends State<BeneficiariesDepPage> {
  final TextEditingController _searchController = TextEditingController();
  String selectedCategory = 'All';
  String selectedStatus = 'All';

  List<Beneficiary> beneficiaries = [
    Beneficiary(
      id: '1',
      name: 'Ahmad Hassan',
      category: 'Family',
      status: 'Active',
      dependents: 4,
      location: 'Cairo',
      phone: '+20 12 3456 7890',
      monthlyIncome: 1200.0,
      lastDistribution: DateTime.now().subtract(Duration(days: 15)),
    ),
    Beneficiary(
      id: '2',
      name: 'Fatima Ali',
      category: 'Elderly',
      status: 'Active',
      dependents: 0,
      location: 'Alexandria',
      phone: '+20 11 2345 6789',
      monthlyIncome: 800.0,
      lastDistribution: DateTime.now().subtract(Duration(days: 8)),
    ),
    Beneficiary(
      id: '3',
      name: 'Omar Mohammed',
      category: 'Orphan',
      status: 'Pending',
      dependents: 0,
      location: 'Giza',
      phone: '+20 10 1234 5678',
      monthlyIncome: 0.0,
      lastDistribution: null,
    ),
  ];

  List<String> categories = ['All', 'Family', 'Elderly', 'Orphan', 'Disabled'];
  List<String> statuses = ['All', 'Active', 'Pending', 'Inactive'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: MainText(
          context.l10n.data_beneficiaries_dependents,
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: AppColors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: _showFilterDialog,
          ),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          SearchAndStatsWidgets(
            searchController: _searchController,
            beneficiaries: beneficiaries,
            onChanged: (value) {
              setState(() {});
            },
          ),
          _buildFilterChips(),
          Expanded(child: _buildBeneficiariesList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddBeneficiaryForm,
        backgroundColor: Colors.green.shade600,
        child: Icon(Icons.person_add, color: Colors.white),
      ),
    );
  }

  Widget _buildFilterChips() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    categories.map((category) {
                      final isSelected = selectedCategory == category;
                      return Container(
                        margin: EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: MainText(category),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              selectedCategory = category;
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

  Widget _buildBeneficiariesList() {
    List<Beneficiary> filteredBeneficiaries =
        beneficiaries.where((b) {
          final matchesSearch =
              b.name.toLowerCase().contains(
                _searchController.text.toLowerCase(),
              ) ||
              b.location.toLowerCase().contains(
                _searchController.text.toLowerCase(),
              );
          final matchesCategory =
              selectedCategory == 'All' || b.category == selectedCategory;
          final matchesStatus =
              selectedStatus == 'All' || b.status == selectedStatus;

          return matchesSearch && matchesCategory && matchesStatus;
        }).toList();

    if (filteredBeneficiaries.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64, color: Colors.grey.shade400),
            SizedBox(height: 16),
            Text(
              'No beneficiaries found',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Try adjusting your search or filters',
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: filteredBeneficiaries.length,
      itemBuilder: (context, index) {
        return BeneficiaryCard(beneficiary: filteredBeneficiaries[index]);
      },
    );
  }


  void _showFilterDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Filter Beneficiaries'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  value: selectedStatus,
                  decoration: InputDecoration(labelText: 'Status'),
                  items:
                      statuses
                          .map(
                            (status) => DropdownMenuItem(
                              value: status,
                              child: Text(status),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedStatus = value!;
                    });
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Apply'),
              ),
            ],
          ),
    );
  }

  void _showAddBeneficiaryForm() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddBeneficiaryForm()),
    );
  }

}

class Beneficiary {
  final String id;
  final String name;
  final String category;
  final String status;
  final int dependents;
  final String location;
  final String phone;
  final double monthlyIncome;
  final DateTime? lastDistribution;

  Beneficiary({
    required this.id,
    required this.name,
    required this.category,
    required this.status,
    required this.dependents,
    required this.location,
    required this.phone,
    required this.monthlyIncome,
    this.lastDistribution,
  });
}
