import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../shared/widgets/main_text.dart';
import 'widgets/category_card.dart';

// 1. Defining the BeneficiaryCategory class
class BeneficiaryCategory {
  final String id;
  String name;
  String description;
  int beneficiaryCount;
  IconData icon;
  Color color;
  String priority;
  bool isActive;
  List<String> criteria;
  DateTime lastUpdated;

  BeneficiaryCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.beneficiaryCount,
    required this.icon,
    required this.color,
    required this.priority,
    required this.isActive,
    required this.criteria,
    required this.lastUpdated,
  });
}

class BeneficiaryCategoriesPage extends StatefulWidget {
  const BeneficiaryCategoriesPage({super.key});

  static const routeName = '/beneficiary_categories';

  @override
  State<BeneficiaryCategoriesPage> createState() =>
      _BeneficiaryCategoriesPageState();
}

class _BeneficiaryCategoriesPageState extends State<BeneficiaryCategoriesPage> {
  final TextEditingController _searchController = TextEditingController();

  List<BeneficiaryCategory> categories = [
    BeneficiaryCategory(
      id: '1',
      name: 'Families in Need',
      description: 'Families facing financial hardship and basic needs',
      beneficiaryCount: 245,
      icon: Icons.family_restroom,
      color: Colors.blue,
      priority: 'High',
      isActive: true,
      criteria: [
        'Household income below poverty line',
        'Unemployed head of household',
        'Medical expenses burden',
      ],
      lastUpdated: DateTime.now().subtract(Duration(days: 5)),
    ),
    BeneficiaryCategory(
      id: '2',
      name: 'Elderly Care',
      description: 'Senior citizens requiring support and assistance',
      beneficiaryCount: 128,
      icon: Icons.elderly,
      color: Colors.purple,
      priority: 'High',
      isActive: true,
      criteria: ['Age 65 and above', 'Limited mobility', 'Social isolation'],
      lastUpdated: DateTime.now().subtract(Duration(days: 12)),
    ),
    BeneficiaryCategory(
      id: '3',
      name: 'Orphans & Vulnerable Children',
      description: 'Children without parental care or at risk',
      beneficiaryCount: 89,
      icon: Icons.child_care,
      color: Colors.orange,
      priority: 'Critical',
      isActive: true,
      criteria: [
        'No living parents or guardians',
        'Child-headed households',
        'Street children',
      ],
      lastUpdated: DateTime.now().subtract(Duration(days: 3)),
    ),
    BeneficiaryCategory(
      id: '4',
      name: 'People with Disabilities',
      description: 'Individuals with physical or mental disabilities',
      beneficiaryCount: 67,
      icon: Icons.accessible,
      color: Colors.teal,
      priority: 'High',
      isActive: true,
      criteria: [
        'Certified disability',
        'Limited income due to disability',
        'Need for assistive devices',
      ],
      lastUpdated: DateTime.now().subtract(Duration(days: 8)),
    ),
    BeneficiaryCategory(
      id: '5',
      name: 'Single Mothers',
      description: 'Single mothers struggling to support their families',
      beneficiaryCount: 156,
      icon: Icons.woman,
      color: Colors.pink,
      priority: 'Medium',
      isActive: true,
      criteria: [
        'Single parent household',
        'Limited financial resources',
        'Young children',
      ],
      lastUpdated: DateTime.now().subtract(Duration(days: 15)),
    ),
    BeneficiaryCategory(
      id: '6',
      name: 'Refugees',
      description: 'Displaced persons seeking asylum and support',
      beneficiaryCount: 34,
      icon: Icons.flight_takeoff,
      color: Colors.red,
      priority: 'Critical',
      isActive: false,
      criteria: [
        'Documented refugee status',
        'Recent arrival',
        'Limited local support',
      ],
      lastUpdated: DateTime.now().subtract(Duration(days: 45)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: MainText(
          context.l10n.eligible_categories,
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
          IconButton(icon: Icon(Icons.sort), onPressed: _showSortDialog),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          _buildSearchAndStats(),
          Expanded(child: _buildCategoriesList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCategoryDialog,
        backgroundColor: Colors.indigo.shade600,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildSearchAndStats() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search categories...',
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
              suffixIcon:
                  _searchController.text.isNotEmpty
                      ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {});
                        },
                      )
                      : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.indigo.shade600),
              ),
              filled: true,
              fillColor: Colors.grey.shade50,
            ),
            onChanged: (value) => setState(() {}),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Total Categories',
                  categories.length.toString(),
                  Icons.category,
                  Colors.blue,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Active',
                  categories.where((c) => c.isActive).length.toString(),
                  Icons.check_circle,
                  Colors.green,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Total Beneficiaries',
                  categories
                      .fold(0, (sum, c) => sum + c.beneficiaryCount)
                      .toString(),
                  Icons.people,
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
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesList() {
    List<BeneficiaryCategory> filteredCategories =
        categories.where((c) {
          return c.name.toLowerCase().contains(
                _searchController.text.toLowerCase(),
              ) ||
              c.description.toLowerCase().contains(
                _searchController.text.toLowerCase(),
              );
        }).toList();

    if (filteredCategories.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.category_outlined,
              size: 64,
              color: Colors.grey.shade400,
            ),
            SizedBox(height: 16),
            Text(
              'No categories found',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Try adjusting your search',
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: filteredCategories.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          category: filteredCategories[index],
          deleteCategory: (category) => _deleteCategory(category),
          toggleCategoryStatus: (category) =>
              _toggleCategoryStatus(category),
        );
      },
    );
  }

  void _showSortDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Sort Categories'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text('Name (A-Z)'),
                  onTap: () {
                    setState(() {
                      categories.sort((a, b) => a.name.compareTo(b.name));
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Beneficiary Count'),
                  onTap: () {
                    setState(() {
                      categories.sort(
                        (a, b) =>
                            b.beneficiaryCount.compareTo(a.beneficiaryCount),
                      );
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Priority'),
                  onTap: () {
                    setState(() {
                      Map<String, int> priorityOrder = {
                        'Critical': 0,
                        'High': 1,
                        'Medium': 2,
                        'Low': 3,
                      };
                      categories.sort(
                        (a, b) => (priorityOrder[a.priority] ?? 4).compareTo(
                          priorityOrder[b.priority] ?? 4,
                        ),
                      );
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Last Updated'),
                  onTap: () {
                    setState(() {
                      categories.sort(
                        (a, b) => b.lastUpdated.compareTo(a.lastUpdated),
                      );
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
    );
  }

  // 2. Completed Functions
  // هنا قمنا بإكمال الوظائف التي كانت ناقصة

  // Function to add a new category
  void _showAddCategoryDialog() {
    // This would typically open a new screen or a more complex dialog to enter all details.
    // For simplicity, we'll just add a pre-defined new category.
    setState(() {
      final newCategory = BeneficiaryCategory(
        id: (categories.length + 1).toString(),
        name: 'New Test Category',
        description: 'Description for the new category',
        beneficiaryCount: 0,
        icon: Icons.new_releases,
        color: Colors.indigo,
        priority: 'Medium',
        isActive: true,
        criteria: ['New criterion'],
        lastUpdated: DateTime.now(),
      );
      categories.add(newCategory);
    });
  }

  void _deleteCategory(BeneficiaryCategory category) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Confirm Deletion'),
            content: Text(
              'Are you sure you want to delete the category "${category.name}"?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    categories.removeWhere((c) => c.id == category.id);
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('"${category.name}" has been deleted.'),
                    ),
                  );
                },
                child: Text('Delete', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );
  }

  void _toggleCategoryStatus(BeneficiaryCategory category) {
    setState(() {
      category.isActive = !category.isActive;
      category.lastUpdated = DateTime.now();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${category.name} has been ${category.isActive ? "activated" : "deactivated"}',
        ),
      ),
    );
  }
}
