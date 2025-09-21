import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_textfield.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../shared/widgets/main_text.dart';
import 'add_region.dart';
import 'edit_region.dart';
import 'widgets/region_item.dart';

class RegionsPages extends StatefulWidget {
  const RegionsPages({super.key});

  static const routeName = '/regions';

  @override
  State<RegionsPages> createState() => _RegionsPagesState();
}

class _RegionsPagesState extends State<RegionsPages> {
  final TextEditingController _searchController = TextEditingController();
  String selectedType = 'All';
  bool showMapView = false;

  List<Region> regions = [
    Region(
      id: '1',
      name: 'القاهرة الكبرى',
      type: 'حضرية كبرى',
      description: 'منطقة حضرية كبرى تشمل القاهرة والمناطق المحيطة',
      beneficiaryCount: 1245,
      distributorCount: 15,
      activeProjects: 8,
      coverage: 85.5,
      coordinator: 'أحمد حسن',
      phone: '+20 12 3456 7890',
      email: 'cairo@charity.org',
      address: '١٢٣ ميدان التحرير، القاهرة',
      isActive: true,
      priority: 'عالية',
      lastActivity: DateTime.now().subtract(const Duration(hours: 2)),
      districts: ['وسط القاهرة', 'الجيزة', 'شبرا', 'مصر الجديدة', 'المعادي'],
    ),
    Region(
      id: '2',
      name: 'ساحل الإسكندرية',
      type: 'حضري',
      description: 'منطقة ساحلية تشمل الإسكندرية والمناطق الساحلية المجاورة',
      beneficiaryCount: 678,
      distributorCount: 8,
      activeProjects: 5,
      coverage: 78.2,
      coordinator: 'فاطمة علي',
      phone: '+20 11 2345 6789',
      email: 'alex@charity.org',
      address: '٤٥٦ شارع الكورنيش، الإسكندرية',
      isActive: true,
      priority: 'متوسطة',
      lastActivity: DateTime.now().subtract(const Duration(hours: 5)),
      districts: ['وسط الإسكندرية', 'المنتزه', 'العامرية', 'برج العرب'],
    ),
    Region(
      id: '3',
      name: 'صعيد مصر الريفي',
      type: 'ريفي',
      description: 'مناطق ريفية في جنوب مصر تشمل الأقصر وأسوان والقرى المحيطة',
      beneficiaryCount: 2156,
      distributorCount: 12,
      activeProjects: 12,
      coverage: 65.8,
      coordinator: 'عمر محمد',
      phone: '+20 10 1234 5678',
      email: 'upperegypt@charity.org',
      address: '٧٨٩ طريق وادي النيل، الأقصر',
      isActive: true,
      priority: 'حرجة',
      lastActivity: DateTime.now().subtract(const Duration(hours: 8)),
      districts: ['الأقصر', 'أسوان', 'قنا', 'سوهاج', 'المنيا'],
    ),
    Region(
      id: '4',
      name: 'منطقة الدلتا',
      type: 'زراعية',
      description: 'منطقة دلتا زراعية تضم المجتمعات الزراعية',
      beneficiaryCount: 987,
      distributorCount: 6,
      activeProjects: 4,
      coverage: 72.1,
      coordinator: 'سارة أحمد',
      phone: '+20 15 9876 5432',
      email: 'delta@charity.org',
      address: '٣٢١ حقول الدلتا، المنصورة',
      isActive: true,
      priority: 'متوسطة',
      lastActivity: DateTime.now().subtract(const Duration(days: 1)),
      districts: ['المنصورة', 'طنطا', 'الزقازيق', 'دمنهور', 'كفر الشيخ'],
    ),
    Region(
      id: '5',
      name: 'ساحل البحر الأحمر',
      type: 'نائية',
      description: 'مناطق ساحلية وصحراوية نائية على طول البحر الأحمر',
      beneficiaryCount: 234,
      distributorCount: 3,
      activeProjects: 2,
      coverage: 45.3,
      coordinator: 'خالد محمود',
      phone: '+20 12 5555 0000',
      email: 'redsea@charity.org',
      address: '٥٥٥ طريق الصحراء، الغردقة',
      isActive: false,
      priority: 'منخفضة',
      lastActivity: DateTime.now().subtract(const Duration(days: 7)),
      districts: ['الغردقة', 'مرسى علم', 'سفاجا'],
    ),
  ];

  List<String> regionTypes = [
    'الكل',
    'حضرية كبرى',
    'حضري',
    'ريفي',
    'زراعية',
    'نائية',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: MainText(
          context.l10n.data_places,
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
            icon: Icon(showMapView ? Icons.list : Icons.map),
            onPressed: () {
              setState(() {
                showMapView = !showMapView;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.analytics),
            onPressed: _showRegionAnalytics,
          ),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          _buildSearchAndStats(),
          _buildTypeFilter(),
          Expanded(child: showMapView ? _buildMapView() : _buildRegionsList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddRegionDialog,
        backgroundColor: Colors.teal.shade600,
        child: const Icon(Icons.add_location, color: Colors.white),
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

            hint: context.l10n.search_regions,
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
                  context.l10n.total_regions,
                  regions.length.toString(),
                  Icons.location_on,
                  AppColors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context.l10n.active,
                  regions.where((r) => r.isActive).length.toString(),
                  Icons.check_circle,
                  AppColors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context.l10n.beneficiaries,
                  regions
                      .fold(0, (sum, r) => sum + r.beneficiaryCount)
                      .toString(),
                  Icons.people,
                  Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context.l10n.distributors,
                  regions
                      .fold(0, (sum, r) => sum + r.distributorCount)
                      .toString(),
                  Icons.delivery_dining,
                  Colors.purple,
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
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
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

  Widget _buildTypeFilter() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:
              regionTypes.map((type) {
                final isSelected = selectedType == type;
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: MainText(type),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        selectedType = type;
                      });
                    },
                    backgroundColor: Colors.grey.shade100,
                    selectedColor: Colors.teal.shade100,
                    checkmarkColor: Colors.teal.shade600,
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildMapView() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.map, color: Colors.teal.shade600),
                const SizedBox(width: 8),
                MainText(
                  context.l10n.interactive_map_view,

                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal.shade800,
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.map_outlined,
                    size: 80,
                    color: Colors.teal.shade200,
                  ),
                  const SizedBox(height: 16),
                  MainText(
                    context.l10n.map_integration,

                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.teal.shade600,
                  ),
                  const SizedBox(height: 8),
                  MainText(
                    context.l10n.interactive_map_showing,
                    textAlign: TextAlign.center,
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),

                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: MainText(
                            context.l10n.map_integration_feature_coming_soon,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.fullscreen),
                    label: MainText(context.l10n.open_full_map),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade600,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegionsList() {
    List<Region> filteredRegions =
        regions.where((r) {
          final matchesSearch =
              r.name.toLowerCase().contains(
                _searchController.text.toLowerCase(),
              ) ||
              r.description.toLowerCase().contains(
                _searchController.text.toLowerCase(),
              );
          final matchesType = selectedType == 'All' || r.type == selectedType;

          return matchesSearch && matchesType;
        }).toList();

    if (filteredRegions.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_off, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            MainText(
              context.l10n.no_regions_found,

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
      itemCount: filteredRegions.length,
      itemBuilder: (context, index) {
        final region = filteredRegions[index];
        return RegionCard(
          region: region,
          onEdit: (r) => _editRegion(r),
          onViewOnMap: (r) => _viewOnMap(r),
          onViewDistributors: (r) => _viewDistributors(r),
        );
      },
    );
  }

  void _showRegionAnalytics() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: MainText(context.l10n.regional_analytics),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildAnalyticRow(
                    context.l10n.total_coverage,
                    '${(regions.fold(0.0, (sum, r) => sum + r.coverage) / regions.length).toStringAsFixed(1)}%',
                  ),
                  _buildAnalyticRow(
                    context.l10n.highest_priority,
                    regions.where((r) => r.priority == 'Critical').isNotEmpty
                        ? 'Critical regions found'
                        : 'No critical regions',
                  ),
                  _buildAnalyticRow(
                    context.l10n.most_active,
                    regions
                        .reduce(
                          (a, b) => a.activeProjects > b.activeProjects ? a : b,
                        )
                        .name,
                  ),
                  _buildAnalyticRow(
                    context.l10n.largest_region,
                    regions
                        .reduce(
                          (a, b) =>
                              a.beneficiaryCount > b.beneficiaryCount ? a : b,
                        )
                        .name,
                  ),
                  _buildAnalyticRow(
                    context.l10n.best_coverage,
                    regions
                        .reduce((a, b) => a.coverage > b.coverage ? a : b)
                        .name,
                  ),
                ],
              ),
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
          Expanded(
            child: MainText(
              value,
              color: Colors.teal.shade600,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  void _showAddRegionDialog() async {
    final newRegion = await Navigator.push<Region>(
      context,
      MaterialPageRoute(builder: (context) => const AddRegionForm()),
    );

    if (newRegion != null) {
      setState(() {
        regions.add(newRegion);
      });
    }
  }

  void _editRegion(Region region) async {
    final updatedRegion = await Navigator.push<Region>(
      context,
      MaterialPageRoute(builder: (context) => EditRegionForm(region: region)),
    );

    if (updatedRegion != null) {
      setState(() {
        final index = regions.indexWhere((r) => r.id == updatedRegion.id);
        if (index != -1) {
          regions[index] = updatedRegion;
        }
      });
    }
  }

  void _viewOnMap(Region region) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: MainText('${context.l10n.view_on_map} ${region.name}'),
            content: MainText(
              '${context.l10n.showing_details_for} ${region.name} at:\n\n${region.address}${context.l10n.full_map_integration_is_coming_soon}',
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

  void _viewDistributors(Region region) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: MainText('${context.l10n.distributors_in} ${region.name}'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainText(
                    ' ${context.l10n.this_region_has} ${region.distributorCount} ${context.l10n.distributors_covering_the_following_districts}',
                  ),
                  const SizedBox(height: 10),
                  ...region.districts.map((d) => Text('• $d')).toList(),
                ],
              ),
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
}

class Region {
  final String id;
  final String name;
  final String type;
  final String description;
  final int beneficiaryCount;
  final int distributorCount;
  final int activeProjects;
  final double coverage;
  final String coordinator;
  final String phone;
  final String email;
  final String address;
  final bool isActive;
  final String priority;
  final DateTime lastActivity;
  final List<String> districts;

  Region({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.beneficiaryCount,
    required this.distributorCount,
    required this.activeProjects,
    required this.coverage,
    required this.coordinator,
    required this.phone,
    required this.email,
    required this.address,
    required this.isActive,
    required this.priority,
    required this.lastActivity,
    required this.districts,
  });
}
