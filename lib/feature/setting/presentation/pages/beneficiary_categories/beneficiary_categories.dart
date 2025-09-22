import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_textfield.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../shared/widgets/main_text.dart';
import 'add_beneficiary_page.dart';
import 'edit_beneficiary.dart';
import 'widgets/category_card.dart';

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
      name: 'الأسر المحتاجة',
      description:
          'الأسر التي تواجه صعوبات مالية وتحتاج لتوفير الاحتياجات الأساسية',
      beneficiaryCount: 245,
      icon: Icons.family_restroom,
      color: Colors.blue,
      priority: 'عالية',
      isActive: true,
      criteria: [
        'دخل الأسرة أقل من خط الفقر',
        'رب الأسرة عاطل عن العمل',
        'عبء المصاريف الطبية',
      ],
      lastUpdated: DateTime.now().subtract(const Duration(days: 5)),
    ),
    BeneficiaryCategory(
      id: '2',
      name: 'رعاية المسنين',
      description: 'كبار السن الذين يحتاجون إلى دعم ومساعدة',
      beneficiaryCount: 128,
      icon: Icons.elderly,
      color: Colors.purple,
      priority: 'عالية',
      isActive: true,
      criteria: [
        'العمر 65 فما فوق',
        'ضعف الحركة أو محدوديتها',
        'العزلة الاجتماعية',
      ],
      lastUpdated: DateTime.now().subtract(const Duration(days: 12)),
    ),
    BeneficiaryCategory(
      id: '3',
      name: 'الأيتام والأطفال المعرضون للخطر',
      description: 'الأطفال بدون رعاية أبوية أو في ظروف خطرة',
      beneficiaryCount: 89,
      icon: Icons.child_care,
      color: Colors.orange,
      priority: 'حرجة',
      isActive: true,
      criteria: [
        'بدون والدين أو أوصياء أحياء',
        'الأسر التي يعيلها أطفال',
        'أطفال الشوارع',
      ],
      lastUpdated: DateTime.now().subtract(const Duration(days: 3)),
    ),
    // ... باقي الفئات
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          IconButton(icon: const Icon(Icons.sort), onPressed: _showSortDialog),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          _buildSearchAndStats(),
          Expanded(child: _buildCategoriesList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddCategoryPage,
        backgroundColor: Colors.indigo.shade600,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildSearchAndStats() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          MainTextField(
            controller: _searchController,

            hint: context.l10n.search_categories,
            prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
            suffixIcon:
                _searchController.text.isNotEmpty
                    ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {});
                      },
                    )
                    : null,

            onChanged: (value) => setState(() {}),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context.l10n.total_categories,
                  categories.length.toString(),
                  Icons.category,
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context.l10n.active,
                  categories.where((c) => c.isActive).length.toString(),
                  Icons.check_circle,
                  Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context.l10n.total_beneficiaries,
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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withAlpha(50)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 4),
          MainText(
            value,

            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
          MainText(
            title,
            fontSize: 11,
            color: Colors.grey.shade600,
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
            const SizedBox(height: 16),
            MainText(
              context.l10n.no_categories_found,

              fontSize: 18,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 8),
            MainText(
              context.l10n.try_adjusting_your_search,
              color: Colors.grey.shade500,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredCategories.length,
      itemBuilder: (context, index) {
        final category = filteredCategories[index];
        return CategoryCard(
          category: category,
          deleteCategory: () => _deleteCategory(category),
          toggleCategoryStatus: () => _toggleCategoryStatus(category),
          editCategory: () => _navigateToEditCategoryPage(category),
        );
      },
    );
  }

  void _showSortDialog() {
    // ... This function remains unchanged ...
  }

  void _navigateToAddCategoryPage() async {
    final newCategory = await Navigator.push<BeneficiaryCategory>(
      context,
      MaterialPageRoute(
        builder: (context) => const AddBeneficiaryCategoryPage(),
      ),
    );
    if (newCategory != null) {
      setState(() {
        categories.add(newCategory);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: MainText(
            '${context.l10n.category} "${newCategory.name}" ${context.l10n.added_successfully}',
          ),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void _navigateToEditCategoryPage(BeneficiaryCategory category) async {
    final updatedCategory = await Navigator.push<BeneficiaryCategory>(
      context,
      MaterialPageRoute(
        builder: (context) => EditBeneficiaryCategoryPage(category: category),
      ),
    );
    if (updatedCategory != null) {
      setState(() {
        final index = categories.indexWhere((c) => c.id == updatedCategory.id);
        if (index != -1) {
          categories[index] = updatedCategory;
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: MainText(
            '${context.l10n.category} "${updatedCategory.name}"${context.l10n.updated_successfully}',
          ),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void _toggleCategoryStatus(BeneficiaryCategory category) {
    setState(() {
      final index = categories.indexWhere((c) => c.id == category.id);
      if (index != -1) {
        categories[index] = BeneficiaryCategory(
          id: category.id,
          name: category.name,
          description: category.description,
          beneficiaryCount: category.beneficiaryCount,
          icon: category.icon,
          color: category.color,
          priority: category.priority,
          isActive: !category.isActive, // Toggle status
          criteria: category.criteria,
          lastUpdated: DateTime.now(), // Update timestamp
        );
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MainText(
          '${category.name} ${!category.isActive ? 'activated' : 'deactivated'}',
        ),
        backgroundColor: !category.isActive ? Colors.green : Colors.orange,
      ),
    );
  }

  void _deleteCategory(BeneficiaryCategory category) {
    // ... This function remains unchanged ...
  }
}

class BeneficiaryCategory {
  final String id;
  final String name;
  final String description;
  final int beneficiaryCount;
  final IconData icon;
  final Color color;
  final String priority;
  final bool isActive;
  final List<String> criteria;
  final DateTime lastUpdated;

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
