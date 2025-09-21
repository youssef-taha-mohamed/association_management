import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_textfield.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../shared/widgets/main_text.dart';
import 'add_donation.dart';
import 'edit_donation.dart';
import 'widgets/donation_type_item.dart';

class DonationTypesPage extends StatefulWidget {
  const DonationTypesPage({super.key});

  static const routeName = '/donation_types';

  @override
  State<DonationTypesPage> createState() => _DonationTypesPageState();
}

class _DonationTypesPageState extends State<DonationTypesPage> {
  final TextEditingController _searchController = TextEditingController();
  String selectedCategory = 'All';

  List<DonationType> donationTypes = [
    DonationType(
      id: '1',
      name: 'طرود غذائية',
      category: 'غذاء',
      description: 'طرود غذائية شهرية تحتوي على المواد الأساسية',
      unit: 'طرد',
      estimatedValue: 50.0,
      icon: Icons.local_grocery_store,
      color: AppColors.green,
      isActive: true,
      donationsCount: 1245,
      lastDonation: DateTime.now().subtract(const Duration(hours: 2)),
      items: ['أرز', 'زيت', 'سكر', 'دقيق', 'عدس', 'معلبات'],
    ),
    DonationType(
      id: '2',
      name: 'مساعدات نقدية',
      category: 'مال',
      description: 'دعم مالي مباشر للأسر المحتاجة',
      unit: 'دولار',
      estimatedValue: 100.0,
      icon: Icons.attach_money,
      color: AppColors.blue,
      isActive: true,
      donationsCount: 823,
      lastDonation: DateTime.now().subtract(const Duration(minutes: 30)),
      items: ['أموال طارئة', 'مساعدة في الإيجار', 'فواتير خدمات', 'نفقات طبية'],
    ),
    DonationType(
      id: '3',
      name: 'ملابس شتوية',
      category: 'ملابس',
      description: 'ملابس دافئة لفصل الشتاء',
      unit: 'طقم',
      estimatedValue: 75.0,
      icon: Icons.checkroom,
      color: Colors.orange,
      isActive: true,
      donationsCount: 456,
      lastDonation: DateTime.now().subtract(const Duration(days: 1)),
      items: ['معاطف', 'بطاطين', 'أحذية دافئة', 'قبعات', 'قفازات'],
    ),
    DonationType(
      id: '4',
      name: 'مستلزمات طبية',
      category: 'دواء',
      description: 'مستلزمات طبية وأدوية أساسية',
      unit: 'حقيبة',
      estimatedValue: 120.0,
      icon: Icons.medical_services,
      color: AppColors.red,
      isActive: true,
      donationsCount: 234,
      lastDonation: DateTime.now().subtract(const Duration(hours: 6)),
      items: [
        'أدوات إسعاف أولي',
        'أدوية أساسية',
        'معدات طبية',
        'مستلزمات نظافة',
      ],
    ),
    DonationType(
      id: '5',
      name: 'مستلزمات مدرسية',
      category: 'تعليم',
      description: 'مواد تعليمية للأطفال',
      unit: 'طقم',
      estimatedValue: 30.0,
      icon: Icons.school,
      color: Colors.purple,
      isActive: true,
      donationsCount: 678,
      lastDonation: DateTime.now().subtract(const Duration(days: 3)),
      items: ['كراريس', 'أقلام', 'كتب', 'حقائب مدرسية', 'آلات حاسبة'],
    ),
    DonationType(
      id: '6',
      name: 'إلكترونيات',
      category: 'تقنية',
      description: 'إلكترونيات وأجهزة مستعملة',
      unit: 'جهاز',
      estimatedValue: 200.0,
      icon: Icons.devices,
      color: Colors.teal,
      isActive: false,
      donationsCount: 89,
      lastDonation: DateTime.now().subtract(const Duration(days: 15)),
      items: ['هواتف', 'أجهزة لوحية', 'حاسبات محمولة', 'شواحن'],
    ),
  ];

  List<String> categories = [
    'الكل',
    'غذاء',
    'مال',
    'ملابس',
    'دواء',
    'تعليم',
    'تقنية',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: MainText(
          context.l10n.donation_types,
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
            icon: const Icon(Icons.analytics),
            onPressed: _showAnalytics,
          ),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          _buildSearchAndStats(),
          _buildCategoryFilter(),
          Expanded(child: _buildDonationTypesList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddDonationTypePage,
        backgroundColor: Colors.cyan.shade600,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildSearchAndStats() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          MainTextField(
            controller: _searchController,

            hint: context.l10n.search_donation_types,
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
                  context.l10n.types,
                  donationTypes.length.toString(),
                  Icons.category,
                  AppColors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context.l10n.active,
                  donationTypes.where((d) => d.isActive).length.toString(),
                  Icons.check_circle,
                  AppColors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context.l10n.total_donations,
                  donationTypes
                      .fold(0, (sum, d) => sum + d.donationsCount)
                      .toString(),
                  Icons.favorite,
                  AppColors.red,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context.l10n.avg_value,
                  '\$${(donationTypes.fold(0.0, (sum, d) => sum + d.estimatedValue) / (donationTypes.isEmpty ? 1 : donationTypes.length)).toStringAsFixed(0)}',
                  Icons.attach_money,
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
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withAlpha(50)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(height: 4),
          MainText(
            value,

            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
          MainText(
            title,
            fontSize: 10,
            color: Colors.grey.shade600,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:
              categories.map((category) {
                final isSelected = selectedCategory == category;
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: MainText(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    backgroundColor: Colors.grey.shade100,
                    selectedColor: Colors.cyan.shade100,
                    checkmarkColor: Colors.cyan.shade600,
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildDonationTypesList() {
    List<DonationType> filteredTypes =
        donationTypes.where((d) {
          final matchesSearch =
              d.name.toLowerCase().contains(
                _searchController.text.toLowerCase(),
              ) ||
              d.description.toLowerCase().contains(
                _searchController.text.toLowerCase(),
              );
          final matchesCategory =
              selectedCategory == 'All' || d.category == selectedCategory;

          return matchesSearch && matchesCategory;
        }).toList();

    if (filteredTypes.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.card_giftcard_outlined,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            MainText(
              context.l10n.no_donation_types_found,

              fontSize: 18,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 8),
            MainText(
              context.l10n.try_adjusting_your_search_or_filters,
              color: Colors.grey.shade500,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredTypes.length,
      itemBuilder: (context, index) {
        final donationType = filteredTypes[index];
        return DonationTypeCard(
          donationType: donationType,
          duplicateDonationType: () => _duplicateDonationType(donationType),
          deleteDonationType: () => _deleteDonationType(donationType),
          toggleDonationTypeStatus:
              () => _toggleDonationTypeStatus(donationType),
          editDonationType: () => _navigateToEditDonationTypePage(donationType),
        );
      },
    );
  }

  void _showAnalytics() {
    if (donationTypes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: MainText(context.l10n.no_data_available_for_analytics),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: MainText(context.l10n.donation_analytics),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildAnalyticRow(
                  context.l10n.most_popular,
                  donationTypes
                      .reduce(
                        (a, b) => a.donationsCount > b.donationsCount ? a : b,
                      )
                      .name,
                ),
                _buildAnalyticRow(
                  context.l10n.highest_value,
                  '\$${donationTypes.reduce((a, b) => a.estimatedValue > b.estimatedValue ? a : b).estimatedValue.toStringAsFixed(0)}',
                ),
                _buildAnalyticRow(
                  context.l10n.total_value,
                  '\$${donationTypes.fold(0.0, (sum, d) => sum + (d.estimatedValue * d.donationsCount)).toStringAsFixed(0)}',
                ),
                _buildAnalyticRow(
                  context.l10n.active_types,
                  '${donationTypes.where((d) => d.isActive).length}/${donationTypes.length}',
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: MainText(context.l10n.close),
              ),
            ],
          ),
    );
  }

  Widget _buildAnalyticRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value, style: TextStyle(color: Colors.blue.shade600)),
        ],
      ),
    );
  }

  void _navigateToAddDonationTypePage() async {
    final newDonationType = await Navigator.push<DonationType>(
      context,
      MaterialPageRoute(
        builder:
            (context) => AddDonationTypePage(
              categories:
                  categories.where((c) => c != context.l10n.all).toList(),
            ),
      ),
    );

    if (newDonationType != null) {
      setState(() {
        donationTypes.add(newDonationType);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${context.l10n.donation_type}"${newDonationType.name}" ${context.l10n.added_successfully}',
          ),
          backgroundColor: AppColors.green,
        ),
      );
    }
  }

  void _navigateToEditDonationTypePage(DonationType donationType) async {
    final updatedDonationType = await Navigator.push<DonationType>(
      context,
      MaterialPageRoute(
        builder:
            (context) => EditDonationTypePage(
              donationType: donationType,
              categories:
                  categories.where((c) => c != context.l10n.all).toList(),
            ),
      ),
    );

    if (updatedDonationType != null) {
      setState(() {
        final index = donationTypes.indexWhere(
          (d) => d.id == updatedDonationType.id,
        );
        if (index != -1) {
          donationTypes[index] = updatedDonationType;
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: MainText(
            '${context.l10n.donation_type}"${updatedDonationType.name}" ${context.l10n.updated_successfully}',
          ),
          backgroundColor: AppColors.green,
        ),
      );
    }
  }

  void _duplicateDonationType(DonationType donationType) {
    final newDonationType = DonationType(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: '${donationType.name} (${context.l10n.copy})',
      category: donationType.category,
      description: donationType.description,
      unit: donationType.unit,
      estimatedValue: donationType.estimatedValue,
      icon: donationType.icon,
      color: donationType.color,
      isActive: donationType.isActive,
      donationsCount: 0, // Duplicated items have 0 donations
      lastDonation: DateTime.now(),
      items: List.from(donationType.items),
    );
    setState(() {
      donationTypes.add(newDonationType);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MainText(
          '${donationType.name} ${context.l10n.duplicated_successfully}',
        ),
        backgroundColor: AppColors.green,
      ),
    );
  }

  void _toggleDonationTypeStatus(DonationType donationType) {
    setState(() {
      final index = donationTypes.indexWhere((d) => d.id == donationType.id);
      if (index != -1) {
        donationTypes[index] = DonationType(
          id: donationType.id,
          name: donationType.name,
          category: donationType.category,
          description: donationType.description,
          unit: donationType.unit,
          estimatedValue: donationType.estimatedValue,
          icon: donationType.icon,
          color: donationType.color,
          isActive: !donationType.isActive, // Toggle the status
          donationsCount: donationType.donationsCount,
          lastDonation: donationType.lastDonation,
          items: donationType.items,
        );
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${donationType.name} ${!donationType.isActive ? context.l10n.activated : context.l10n.deactivated}',
        ),
        backgroundColor: !donationType.isActive ? Colors.green : Colors.orange,
      ),
    );
  }

  void _deleteDonationType(DonationType donationType) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: MainText(context.l10n.delete_donation_type),
            content: MainText(
              '${context.l10n.are_you_sure_you_want_to_delete}"${donationType.name}"${context.l10n.this_action_cannot_be_undone}',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: MainText(context.l10n.cancel),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  foregroundColor: AppColors.white,
                ),
                onPressed: () {
                  setState(() {
                    donationTypes.removeWhere((d) => d.id == donationType.id);
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: MainText(
                        '${context.l10n.donation_type} "${donationType.name}" ${context.l10n.deleted_successfully}',
                      ),
                      backgroundColor: AppColors.red,
                    ),
                  );
                },
                child: MainText(context.l10n.delete),
              ),
            ],
          ),
    );
  }
}

class DonationType {
  final String id;
  final String name;
  final String category;
  final String description;
  final String unit;
  final double estimatedValue;
  final IconData icon;
  final Color color;
  final bool isActive;
  final int donationsCount;
  final DateTime lastDonation;
  final List<String> items;

  DonationType({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.unit,
    required this.estimatedValue,
    required this.icon,
    required this.color,
    required this.isActive,
    required this.donationsCount,
    required this.lastDonation,
    required this.items,
  });
}
