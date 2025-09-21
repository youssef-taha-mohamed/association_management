import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../shared/widgets/main_text.dart';
import '../../../../../shared/widgets/main_textfield.dart';
import 'add_workplace.dart';
import 'edit_work_place.dart';
import 'widgets/work_place_item.dart';

class WorkplacesPage extends StatefulWidget {
  const WorkplacesPage({super.key});

  static const routeName = '/workplaces';

  @override
  State<WorkplacesPage> createState() => _WorkplacesPageState();
}

class _WorkplacesPageState extends State<WorkplacesPage> {
  final TextEditingController _searchController = TextEditingController();
  String selectedType = 'All';

  List<Workplace> workplaces = [
    Workplace(
      id: '1',
      name: 'مؤسسة الأمل',
      type: 'منظمة غير حكومية',
      location: 'القاهرة، مصر',
      description: 'منظمة غير ربحية تركز على رعاية الأطفال والتعليم',
      employeeCount: 45,
      isActive: true,
      establishedYear: 2018,
      contactPerson: 'أحمد حسن',
      phone: '+20 12 3456 7890',
      email: 'info@hopefoundation.org',
    ),
    Workplace(
      id: '2',
      name: 'مركز رعاية المجتمع',
      type: 'جمعية',
      location: 'الإسكندرية، مصر',
      description: 'مركز مجتمعي محلي يقدم خدمات صحية واجتماعية',
      employeeCount: 23,
      isActive: true,
      establishedYear: 2015,
      contactPerson: 'فاطمة علي',
      phone: '+20 11 2345 6789',
      email: 'contact@communitycare.org',
    ),
    Workplace(
      id: '3',
      name: 'منظمة الإغاثة',
      type: 'مؤسسة خيرية',
      location: 'الجيزة، مصر',
      description: 'منظمة للإغاثة الطارئة والاستجابة للكوارث',
      employeeCount: 67,
      isActive: true,
      establishedYear: 2012,
      contactPerson: 'عمر محمد',
      phone: '+20 10 1234 5678',
      email: 'help@relieforg.org',
    ),
    Workplace(
      id: '4',
      name: 'مركز تنمية الشباب',
      type: 'منظمة',
      location: 'الأقصر، مصر',
      description: 'برامج لتمكين الشباب وتنمية المهارات',
      employeeCount: 18,
      isActive: false,
      establishedYear: 2020,
      contactPerson: 'سارة أحمد',
      phone: '+20 15 9876 5432',
      email: 'info@youthhub.org',
    ),
  ];

  List<String> workplaceTypes = [
    'الكل',
    'منظمة غير حكومية',
    'جمعية',
    'مؤسسة خيرية',
    'منظمة',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: MainText(
          context.l10n.employers,
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
          _buildTypeFilter(),
          Expanded(child: _buildWorkplacesList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddWorkplaceForm,
        backgroundColor: Colors.purple.shade600,
        child: const Icon(Icons.add_business, color: Colors.white),
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

            hint: context.l10n.search_workplaces,
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
                  context.l10n.total,
                  workplaces.length.toString(),
                  Icons.business,
                  AppColors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context.l10n.active,
                  workplaces.where((w) => w.isActive).length.toString(),
                  Icons.check_circle,
                  AppColors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context.l10n.employees,
                  workplaces
                      .fold(0, (sum, w) => sum + w.employeeCount)
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
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
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
          MainText(title, fontSize: 12, color: Colors.grey.shade600),
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
              workplaceTypes.map((type) {
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
                    selectedColor: Colors.purple.shade100,
                    checkmarkColor: Colors.purple.shade600,
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildWorkplacesList() {
    List<Workplace> filteredWorkplaces =
        workplaces.where((w) {
          final matchesSearch =
              w.name.toLowerCase().contains(
                _searchController.text.toLowerCase(),
              ) ||
              w.location.toLowerCase().contains(
                _searchController.text.toLowerCase(),
              );
          final matchesType = selectedType == 'All' || w.type == selectedType;

          return matchesSearch && matchesType;
        }).toList();

    if (filteredWorkplaces.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.business_center_outlined,
              size: 64,
              color: Colors.grey.shade400,
            ),
            SizedBox(height: 16),
            MainText(
              context.l10n.no_workplaces_found,

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
      itemCount: filteredWorkplaces.length,
      itemBuilder: (context, index) {
        final workplace = filteredWorkplaces[index];
        return WorkplaceCard(
          workplace: workplace,
          onEdit: (wp) => _editWorkplace(wp),
          onViewEmployees: (wp) => _viewEmployees(wp),
        );
      },
    );
  }

  void _showSortDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: MainText(context.l10n.sort_workplaces),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: MainText(context.l10n.name),
                  onTap: () {
                    setState(() {
                      workplaces.sort((a, b) => a.name.compareTo(b.name));
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: MainText(context.l10n.employee_count),
                  onTap: () {
                    setState(() {
                      workplaces.sort(
                        (a, b) => b.employeeCount.compareTo(a.employeeCount),
                      );
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: MainText(context.l10n.established_year),
                  onTap: () {
                    setState(() {
                      workplaces.sort(
                        (a, b) =>
                            b.establishedYear.compareTo(a.establishedYear),
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

  void _showAddWorkplaceForm() async {
    final newWorkplace = await Navigator.push<Workplace>(
      context,
      MaterialPageRoute(builder: (context) => const AddWorkplaceForm()),
    );

    if (newWorkplace != null) {
      setState(() {
        workplaces.add(newWorkplace);
      });
    }
  }

  void _editWorkplace(Workplace workplace) async {
    final updatedWorkplace = await Navigator.push<Workplace>(
      context,
      MaterialPageRoute(
        builder: (context) => EditWorkplaceForm(workplace: workplace),
      ),
    );

    if (updatedWorkplace != null) {
      setState(() {
        final index = workplaces.indexWhere((w) => w.id == updatedWorkplace.id);
        if (index != -1) {
          workplaces[index] = updatedWorkplace;
        }
      });
    }
  }

  void _viewEmployees(Workplace workplace) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: MainText('${context.l10n.employees_at} ${workplace.name}'),
            content: MainText(
              '${context.l10n.viewing_the_ist_of} ${workplace.employeeCount} ${context.l10n.employees_is_a_feature_that_will_be_available_soon}',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: MainText(context.l10n.oK),
              ),
            ],
          ),
    );
  }
}

class Workplace {
  final String id;
  final String name;
  final String type;
  final String location;
  final String description;
  final int employeeCount;
  final bool isActive;
  final int establishedYear;
  final String contactPerson;
  final String phone;
  final String email;

  Workplace({
    required this.id,
    required this.name,
    required this.type,
    required this.location,
    required this.description,
    required this.employeeCount,
    required this.isActive,
    required this.establishedYear,
    required this.contactPerson,
    required this.phone,
    required this.email,
  });
}
