import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_text.dart';
import 'package:management/shared/widgets/main_textfield.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../domain/entities/distributors.dart';
import 'add_distribute.dart';
import 'distributors_details.dart';
import 'edit_distributor.dart';
import 'widgets/distributors_item.dart';

class DistributorsPage extends StatefulWidget {
  const DistributorsPage({super.key});

  static const routeName = '/distributors';

  @override
  State<DistributorsPage> createState() => _DistributorsPageState();
}

class _DistributorsPageState extends State<DistributorsPage> {
  final TextEditingController _searchController = TextEditingController();
  String selectedStatus = 'All';
  String selectedRegion = 'All';

  List<Distributor> distributors = [
    Distributor(
      id: '1',
      name: 'أحمد حسن',
      email: 'ahmed.hassan@charity.org',
      phone: '+20 12 3456 7890',
      region: 'القاهرة الكبرى',
      status: 'Active',
      experience: '3 years',
      rating: 4.8,
      totalDistributions: 245,
      lastDistribution: DateTime.now().subtract(const Duration(hours: 3)),
      joinDate: DateTime(2021, 6, 15),
      specialization: ['Food Packages', 'Medical Supplies'],
      address: '123 Nasr City, Cairo',
      vehicleType: 'Car',
      languages: ['Arabic', 'English'],
      emergencyContact: '+20 11 9999 8888',
      avatar: 'AH',
      availabilityStatus: 'Available',
      nextScheduledDistribution: DateTime.now().add(const Duration(days: 2)),
    ),
    Distributor(
      id: '2',
      name: 'فاطمة الزهراء',
      email: 'fatima.zahra@charity.org',
      phone: '+20 11 2345 6789',
      region: 'ساحل الإسكندرية',
      status: 'Active',
      experience: '2 years',
      rating: 4.6,
      totalDistributions: 189,
      lastDistribution: DateTime.now().subtract(const Duration(days: 1)),
      joinDate: DateTime(2022, 3, 20),
      specialization: ['Clothes', 'School Supplies'],
      address: '456 Alexandria Downtown',
      vehicleType: 'Motorcycle',
      languages: ['Arabic', 'French'],
      emergencyContact: '+20 10 7777 6666',
      avatar: 'FZ',
      availabilityStatus: 'Busy',
      nextScheduledDistribution: DateTime.now().add(const Duration(days: 1)),
    ),
    Distributor(
      id: '3',
      name: 'عمر محمد',
      email: 'omar.mohammed@charity.org',
      phone: '+20 10 1234 5678',
      region: 'صعيد مصر الريفي',
      status: 'Active',
      experience: '5 years',
      rating: 4.9,
      totalDistributions: 412,
      lastDistribution: DateTime.now().subtract(const Duration(hours: 6)),
      joinDate: DateTime(2019, 1, 10),
      specialization: ['Food Packages', 'Cash Assistance', 'Medical Supplies'],
      address: '789 Luxor Center',
      vehicleType: 'Van',
      languages: ['Arabic'],
      emergencyContact: '+20 15 5555 4444',
      avatar: 'OM',
      availabilityStatus: 'Available',
      nextScheduledDistribution: DateTime.now().add(const Duration(hours: 12)),
    ),
    Distributor(
      id: '4',
      name: 'سارة احمد',
      email: 'sara.ahmed@charity.org',
      phone: '+20 15 9876 5432',
      region: 'منطقة الدلتا',
      status: 'On Leave',
      experience: '1.5 years',
      rating: 4.4,
      totalDistributions: 98,
      lastDistribution: DateTime.now().subtract(const Duration(days: 10)),
      joinDate: DateTime(2022, 9, 5),
      specialization: ['School Supplies', 'Clothes'],
      address: '321 Mansoura Downtown',
      vehicleType: 'Bicycle',
      languages: ['Arabic', 'English'],
      emergencyContact: '+20 12 3333 2222',
      avatar: 'SA',
      availabilityStatus: 'On Leave',
      nextScheduledDistribution: null,
    ),
    Distributor(
      id: '5',
      name: 'خالد محمود',
      email: 'khaled.mahmoud@charity.org',
      phone: '+20 12 5555 0000',
      region: 'ساحل البحر الأحمر',
      status: 'Inactive',
      experience: '4 years',
      rating: 4.2,
      totalDistributions: 167,
      lastDistribution: DateTime.now().subtract(const Duration(days: 30)),
      joinDate: DateTime(2020, 11, 8),
      specialization: ['Medical Supplies', 'Emergency Aid'],
      address: '555 Hurghada Marina',
      vehicleType: 'Car',
      languages: ['Arabic', 'English', 'German'],
      emergencyContact: '+20 11 1111 0000',
      avatar: 'KM',
      availabilityStatus: 'Unavailable',
      nextScheduledDistribution: null,
    ),
    Distributor(
      id: '6',
      name: 'مني ابراهيم',
      email: 'mona.ibrahim@charity.org',
      phone: '+20 10 8888 7777',
      region: 'القاهرة الكبرى',
      status: 'Active',
      experience: '2.5 years',
      rating: 4.7,
      totalDistributions: 203,
      lastDistribution: DateTime.now().subtract(const Duration(hours: 8)),
      joinDate: DateTime(2021, 12, 3),
      specialization: ['Food Packages', 'Winter Clothing'],
      address: '888 Heliopolis, Cairo',
      vehicleType: 'Car',
      languages: ['Arabic', 'English'],
      emergencyContact: '+20 15 9999 8888',
      avatar: 'MI',
      availabilityStatus: 'Available',
      nextScheduledDistribution: DateTime.now().add(const Duration(days: 3)),
    ),
  ];
  List<String> statuses = ['الكل', 'نشط', 'في إجازة', 'غير نشط'];
  List<String> regions = [
    'الكل',
    'القاهرة الكبرى',
    'ساحل الإسكندرية',
    'صعيد مصر الريفي',
    'منطقة الدلتا',
    'ساحل البحر الأحمر',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: MainText(context.l10n.distributors, fontWeight: FontWeight.w600),
        backgroundColor: AppColors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showAdvancedFilters,
          ),
          IconButton(
            icon: const Icon(Icons.analytics),
            onPressed: _showDistributorAnalytics,
          ),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          _buildSearchAndStats(),
          _buildFilters(),
          Expanded(child: _buildDistributorsList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDistributorForm,
        backgroundColor: Colors.deepPurple.shade600,
        child: const Icon(Icons.person_add, color: Colors.white),
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

            hint: context.l10n.search_distributors,
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
                  distributors.length.toString(),
                  Icons.people,
                  AppColors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context.l10n.active,
                  distributors
                      .where((d) => d.status == 'Active')
                      .length
                      .toString(),
                  Icons.check_circle,
                  AppColors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context.l10n.available,
                  distributors
                      .where((d) => d.availabilityStatus == 'Available')
                      .length
                      .toString(),
                  Icons.schedule,
                  Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context.l10n.avg_rating,
                  (distributors.fold(0.0, (sum, d) => sum + d.rating) /
                          distributors.length)
                      .toStringAsFixed(1),
                  Icons.star,
                  Colors.amber,
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

  Widget _buildFilters() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        statuses.map((status) {
                          final isSelected = selectedStatus == status;
                          return Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: FilterChip(
                              label: Text(status),
                              selected: isSelected,
                              onSelected: (selected) {
                                setState(() {
                                  selectedStatus = status;
                                });
                              },
                              backgroundColor: Colors.grey.shade100,
                              selectedColor: Colors.deepPurple.shade100,
                              checkmarkColor: Colors.deepPurple.shade600,
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey.shade600),
              const SizedBox(width: 4),
              MainText(
                context.l10n.region,
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        regions.map((region) {
                          final isSelected = selectedRegion == region;
                          return Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: FilterChip(
                              label: Text(
                                region.length > 12
                                    ? '${region.substring(0, 12)}...'
                                    : region,
                                style: const TextStyle(fontSize: 11),
                              ),
                              selected: isSelected,
                              onSelected: (selected) {
                                setState(() {
                                  selectedRegion = region;
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
        ],
      ),
    );
  }

  Widget _buildDistributorsList() {
    List<Distributor> filteredDistributors =
        distributors.where((d) {
          final matchesSearch =
              d.name.toLowerCase().contains(
                _searchController.text.toLowerCase(),
              ) ||
              d.email.toLowerCase().contains(
                _searchController.text.toLowerCase(),
              ) ||
              d.phone.contains(_searchController.text);
          final matchesStatus =
              selectedStatus == 'All' || d.status == selectedStatus;
          final matchesRegion =
              selectedRegion == 'All' || d.region == selectedRegion;

          return matchesSearch && matchesStatus && matchesRegion;
        }).toList();

    if (filteredDistributors.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_search, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            MainText(
              context.l10n.no_distributors_found,

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
      itemCount: filteredDistributors.length,
      itemBuilder: (context, index) {
        final distributor = filteredDistributors[index];
        return DistributorCard(
          distributor: distributor,
          onView: (d) => _showDistributorDetails(d),
          onEdit: (d) => _editDistributor(d),
          onSchedule: (d) => _scheduleDelivery(d),
          onContact: (d) => _contactDistributor(d),
          onDeactivate: (d) => _deactivateDistributor(d),
        );
      },
    );
  }

  void _showAdvancedFilters() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: MainText(context.l10n.advanced_filters),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainText(context.l10n.additional_filtering_options_coming_soon),
                SizedBox(height: 16),
                MainText(context.l10n.filter_by_rating),
                MainText(context.l10n.filter_by_experience),
                MainText(context.l10n.filter_by_vehicle_type),
                MainText(context.l10n.filter_by_specialization),
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

  void _showDistributorAnalytics() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: MainText(context.l10n.distributor_analytics),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildAnalyticRow(
                    context.l10n.total_distributors,
                    distributors.length.toString(),
                  ),
                  _buildAnalyticRow(
                    context.l10n.active_rate,
                    '${((distributors.where((d) => d.status == context.l10n.active).length / distributors.length) * 100).toStringAsFixed(1)}%',
                  ),
                  _buildAnalyticRow(
                    context.l10n.average_rating,
                    (distributors.fold(0.0, (sum, d) => sum + d.rating) /
                            distributors.length)
                        .toStringAsFixed(1),
                  ),
                  _buildAnalyticRow(
                    context.l10n.top_performer,
                    distributors
                        .reduce(
                          (a, b) =>
                              a.totalDistributions > b.totalDistributions
                                  ? a
                                  : b,
                        )
                        .name,
                  ),
                  _buildAnalyticRow(
                    context.l10n.total_deliveries,
                    distributors
                        .fold(0, (sum, d) => sum + d.totalDistributions)
                        .toString(),
                  ),
                  _buildAnalyticRow(
                    context.l10n.available_now,
                    distributors
                        .where(
                          (d) => d.availabilityStatus == context.l10n.available,
                        )
                        .length
                        .toString(),
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
          Text(value, style: TextStyle(color: Colors.deepPurple.shade600)),
        ],
      ),
    );
  }

  void _showDistributorDetails(Distributor distributor) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DistributorDetailsPage(distributor: distributor),
      ),
    );
  }

  void _showAddDistributorForm() async {
    final newDistributor = await Navigator.push<Distributor>(
      context,
      MaterialPageRoute(builder: (context) => AddDistributorForm()),
    );
    if (newDistributor != null) {
      setState(() {
        distributors.add(newDistributor);
      });
    }
  }

  void _editDistributor(Distributor distributor) async {
    final updatedDistributor = await Navigator.push<Distributor>(
      context,
      MaterialPageRoute(
        builder: (context) => EditDistributorForm(distributor: distributor),
      ),
    );
    if (updatedDistributor != null) {
      setState(() {
        final index = distributors.indexWhere(
          (d) => d.id == updatedDistributor.id,
        );
        if (index != -1) {
          distributors[index] = updatedDistributor;
        }
      });
    }
  }

  void _scheduleDelivery(Distributor distributor) {
    showDatePicker(
      context: context,
      initialDate: distributor.nextScheduledDistribution ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          distributor.nextScheduledDistribution = pickedDate;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: MainText(
              '${context.l10n.delivery_scheduled_for} ${context.l10n.on}${distributor.name} on ${pickedDate.toLocal().toString().split(' ')[0]}',
            ),
            backgroundColor: AppColors.green,
          ),
        );
      }
    });
  }

  void _contactDistributor(Distributor distributor) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: MainText('${context.l10n.contact} ${distributor.name}'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.phone, color: AppColors.green),
                  title: MainText(context.l10n.call),
                  subtitle: MainText(distributor.phone),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: MainText(
                          '${context.l10n.calling} ${distributor.phone}...',
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.email, color: Colors.blue),
                  title: MainText(context.l10n.email),
                  subtitle: MainText(distributor.email),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: MainText(
                          '${context.l10n.opening_email_to} ${distributor.email}...',
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.emergency, color: Colors.red),
                  title: MainText(context.l10n.emergency_contact),
                  subtitle: MainText(distributor.emergencyContact),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: MainText(
                          context.l10n.calling_emergency_contact,
                        ),
                      ),
                    );
                  },
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

  void _deactivateDistributor(Distributor distributor) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: MainText(context.l10n.deactivate_distributor),
            content: MainText(
              '${context.l10n.are_you_sure_you_want_to_deactivate} ${distributor.name}?',
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
                    distributor.status = context.l10n.inactive;
                    distributor.availabilityStatus = context.l10n.unavailable;
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: MainText(
                        '${distributor.name} ${context.l10n.has_been_deactivated}',
                      ),
                      backgroundColor: AppColors.red,
                    ),
                  );
                },
                child: MainText(context.l10n.deactivate),
              ),
            ],
          ),
    );
  }
}
