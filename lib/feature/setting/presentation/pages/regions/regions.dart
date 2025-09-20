import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
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
      name: 'Greater Cairo',
      type: 'Metropolitan',
      description: 'Major metropolitan area including Cairo and surrounding districts',
      beneficiaryCount: 1245,
      distributorCount: 15,
      activeProjects: 8,
      coverage: 85.5,
      coordinator: 'Ahmed Hassan',
      phone: '+20 12 3456 7890',
      email: 'cairo@charity.org',
      address: '123 Tahrir Square, Cairo',
      isActive: true,
      priority: 'High',
      lastActivity: DateTime.now().subtract(const Duration(hours: 2)),
      districts: ['Cairo Center', 'Giza', 'Shubra', 'Heliopolis', 'Maadi'],
    ),
    Region(
      id: '2',
      name: 'Alexandria Coastal',
      type: 'Urban',
      description: 'Coastal region covering Alexandria and nearby coastal areas',
      beneficiaryCount: 678,
      distributorCount: 8,
      activeProjects: 5,
      coverage: 78.2,
      coordinator: 'Fatima Ali',
      phone: '+20 11 2345 6789',
      email: 'alex@charity.org',
      address: '456 Corniche Street, Alexandria',
      isActive: true,
      priority: 'Medium',
      lastActivity: DateTime.now().subtract(const Duration(hours: 5)),
      districts: ['Alexandria Center', 'Montaza', 'Amreya', 'Borg El Arab'],
    ),
    Region(
      id: '3',
      name: 'Upper Egypt Rural',
      type: 'Rural',
      description: 'Rural areas in southern Egypt including Luxor, Aswan, and surrounding villages',
      beneficiaryCount: 2156,
      distributorCount: 12,
      activeProjects: 12,
      coverage: 65.8,
      coordinator: 'Omar Mohammed',
      phone: '+20 10 1234 5678',
      email: 'upperegypt@charity.org',
      address: '789 Nile Valley Road, Luxor',
      isActive: true,
      priority: 'Critical',
      lastActivity: DateTime.now().subtract(const Duration(hours: 8)),
      districts: ['Luxor', 'Aswan', 'Qena', 'Sohag', 'Minya'],
    ),
    Region(
      id: '4',
      name: 'Delta Region',
      type: 'Agricultural',
      description: 'Agricultural delta region with farming communities',
      beneficiaryCount: 987,
      distributorCount: 6,
      activeProjects: 4,
      coverage: 72.1,
      coordinator: 'Sara Ahmed',
      phone: '+20 15 9876 5432',
      email: 'delta@charity.org',
      address: '321 Delta Fields, Mansoura',
      isActive: true,
      priority: 'Medium',
      lastActivity: DateTime.now().subtract(const Duration(days: 1)),
      districts: ['Mansoura', 'Tanta', 'Zagazig', 'Damanhur', 'Kafr El Sheikh'],
    ),
    Region(
      id: '5',
      name: 'Red Sea Coast',
      type: 'Remote',
      description: 'Remote coastal and desert areas along the Red Sea',
      beneficiaryCount: 234,
      distributorCount: 3,
      activeProjects: 2,
      coverage: 45.3,
      coordinator: 'Khaled Mahmoud',
      phone: '+20 12 5555 0000',
      email: 'redsea@charity.org',
      address: '555 Desert Highway, Hurghada',
      isActive: false,
      priority: 'Low',
      lastActivity: DateTime.now().subtract(const Duration(days: 7)),
      districts: ['Hurghada', 'Marsa Alam', 'Safaga'],
    ),
  ];

  List<String> regionTypes = ['All', 'Metropolitan', 'Urban', 'Rural', 'Agricultural', 'Remote'];

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
          Expanded(
            child: showMapView ? _buildMapView() : _buildRegionsList(),
          ),
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
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search regions...',
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                icon: const Icon(Icons.clear),
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
                borderSide: BorderSide(color: Colors.teal.shade600),
              ),
              filled: true,
              fillColor: Colors.grey.shade50,
            ),
            onChanged: (value) => setState(() {}),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Total Regions',
                  regions.length.toString(),
                  Icons.location_on,
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Active',
                  regions.where((r) => r.isActive).length.toString(),
                  Icons.check_circle,
                  Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Beneficiaries',
                  regions.fold(0, (sum, r) => sum + r.beneficiaryCount).toString(),
                  Icons.people,
                  Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Distributors',
                  regions.fold(0, (sum, r) => sum + r.distributorCount).toString(),
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

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
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
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTypeFilter() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: regionTypes.map((type) {
            final isSelected = selectedType == type;
            return Container(
              margin: const EdgeInsets.only(right: 8),
              child: FilterChip(
                label: Text(type),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Row(
              children: [
                Icon(Icons.map, color: Colors.teal.shade600),
                const SizedBox(width: 8),
                Text(
                  'Interactive Map View',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.teal.shade800,
                  ),
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
                  Text(
                    'Map Integration',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.teal.shade600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Interactive map showing all regions with their\ncoverage areas and activity status',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Map integration - Feature coming soon')),
                      );
                    },
                    icon: const Icon(Icons.fullscreen),
                    label: const Text('Open Full Map'),
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
    List<Region> filteredRegions = regions.where((r) {
      final matchesSearch = r.name.toLowerCase().contains(_searchController.text.toLowerCase()) ||
          r.description.toLowerCase().contains(_searchController.text.toLowerCase());
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
            Text(
              'No regions found',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Try adjusting your search or filters',
              style: TextStyle(color: Colors.grey.shade500),
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
      builder: (context) => AlertDialog(
        title: const Text('Regional Analytics'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildAnalyticRow('Total Coverage', '${(regions.fold(0.0, (sum, r) => sum + r.coverage) / regions.length).toStringAsFixed(1)}%'),
              _buildAnalyticRow('Highest Priority', regions.where((r) => r.priority == 'Critical').isNotEmpty ? 'Critical regions found' : 'No critical regions'),
              _buildAnalyticRow('Most Active', regions.reduce((a, b) => a.activeProjects > b.activeProjects ? a : b).name),
              _buildAnalyticRow('Largest Region', regions.reduce((a, b) => a.beneficiaryCount > b.beneficiaryCount ? a : b).name),
              _buildAnalyticRow('Best Coverage', regions.reduce((a, b) => a.coverage > b.coverage ? a : b).name),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
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
            child: Text(
              value,
              style: TextStyle(color: Colors.teal.shade600),
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
      MaterialPageRoute(
        builder: (context) => const AddRegionForm(),
      ),
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
      MaterialPageRoute(
        builder: (context) => EditRegionForm(region: region),
      ),
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
      builder: (context) => AlertDialog(
        title: Text('View on Map: ${region.name}'),
        content: Text('Showing details for ${region.name} at:\n\n${region.address}\n\nFull map integration is coming soon.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _viewDistributors(Region region) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Distributors in ${region.name}'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('This region has ${region.distributorCount} distributors covering the following districts:'),
              const SizedBox(height: 10),
              ...region.districts.map((d) => Text('• $d')).toList(),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
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