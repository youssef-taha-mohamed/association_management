import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_text.dart';
import '../../../../../../core/style/app_colors.dart';
import '../regions.dart';

class RegionCard extends StatelessWidget {
  const RegionCard({
    super.key,
    required this.region,
    required this.onEdit,
    required this.onViewOnMap,
    required this.onViewDistributors,
  });

  final Region region;
  final Function(Region) onEdit;
  final Function(Region) onViewOnMap;
  final Function(Region) onViewDistributors;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
        border:
            region.isActive
                ? null
                : Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: InkWell(
        onTap: () => _showRegionDetails(context, region),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: _getTypeColor(region.type).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      _getTypeIcon(region.type),
                      color: _getTypeColor(region.type),
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: MainText(
                                region.name,

                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color:
                                    region.isActive
                                        ? Colors.black87
                                        : Colors.grey.shade600,
                              ),
                            ),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color:
                                    region.isActive ? Colors.green : Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: _getTypeColor(region.type),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: MainText(
                                region.type,

                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: _getPriorityColor(
                                  region.priority,
                                ).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: MainText(
                                region.priority,

                                color: _getPriorityColor(region.priority),
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          region.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton(
                    icon: Icon(Icons.more_vert, color: Colors.grey.shade400),
                    itemBuilder:
                        (context) => [
                          PopupMenuItem(
                            value: context.l10n.view,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.visibility,
                                  size: 20,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 8),
                                MainText(context.l10n.view_details),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: context.l10n.edit,
                            child: Row(
                              children: [
                                Icon(Icons.edit, size: 20, color: Colors.green),
                                SizedBox(width: 8),
                                MainText(context.l10n.edit),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: context.l10n.map,
                            child: Row(
                              children: [
                                Icon(Icons.map, size: 20, color: Colors.orange),
                                SizedBox(width: 8),
                                MainText(context.l10n.view_on_map),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: context.l10n.distributors,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.people,
                                  size: 20,
                                  color: Colors.purple,
                                ),
                                SizedBox(width: 8),
                                MainText(context.l10n.view_distributors),
                              ],
                            ),
                          ),
                        ],
                    onSelected: (value) {
                      if (value == 'view') _showRegionDetails(context, region);
                      if (value == 'edit') onEdit(region);
                      if (value == 'map') onViewOnMap(region);
                      if (value == 'distributors') onViewDistributors(region);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildMetricItem(
                        context.l10n.beneficiaries,
                        region.beneficiaryCount.toString(),
                        Icons.people,
                        Colors.blue,
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.grey.shade300,
                    ),
                    Expanded(
                      child: _buildMetricItem(
                        context.l10n.distributors,
                        region.distributorCount.toString(),
                        Icons.delivery_dining,
                        AppColors.green,
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.grey.shade300,
                    ),
                    Expanded(
                      child: _buildMetricItem(
                        context.l10n.projects,
                        region.activeProjects.toString(),
                        Icons.assignment,
                        Colors.orange,
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.grey.shade300,
                    ),
                    Expanded(
                      child: _buildMetricItem(
                        context.l10n.coverage,
                        '${region.coverage.toStringAsFixed(1)}%',
                        Icons.trending_up,
                        Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.person, size: 16, color: Colors.grey.shade500),
                  const SizedBox(width: 4),
                  MainText(
                    region.coordinator,
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),

                  const Spacer(),
                  Icon(
                    Icons.access_time,
                    size: 16,
                    color: Colors.grey.shade500,
                  ),
                  const SizedBox(width: 4),
                  MainText(
                    '${context.l10n.active} ${_formatDate(region.lastActivity)}',
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 4),
        MainText(
          value,

          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: color,
        ),
        MainText(label, fontSize: 11, color: Colors.grey.shade600),
      ],
    );
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'المدن الكبرى':
        return Colors.blue.shade600;
      case 'حضري':
        return Colors.green.shade600;
      case 'ريفي':
        return Colors.orange.shade600;
      case 'زراعي':
        return Colors.brown.shade600;
      case 'بعيد':
        return Colors.grey.shade600;
      default:
        return Colors.teal.shade600;
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type.toLowerCase()) {
      case 'المدن الكبرى':
        return Icons.location_city;
      case 'حضري':
        return Icons.apartment;
      case 'ريفي':
        return Icons.nature;
      case 'زراعي':
        return Icons.agriculture;
      case 'بعيد':
        return Icons.terrain;
      default:
        return Icons.location_on;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${(difference.inDays / 7).floor()}w ago';
    }
  }

  Color _getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'شديد الأهمية':
        return Colors.red;
      case 'عالي':
        return Colors.orange;
      case 'واسطة':
        return Colors.blue;
      case 'قليل':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  void _showRegionDetails(BuildContext context, Region region) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: _getTypeColor(region.type).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _getTypeIcon(region.type),
                    color: _getTypeColor(region.type),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(region.name)),
              ],
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Type', region.type),
                  _buildDetailRow(
                    'Status',
                    region.isActive ? 'Active' : 'Inactive',
                  ),
                  _buildDetailRow('Priority', region.priority),
                  _buildDetailRow('Coverage', '${region.coverage}%'),
                  _buildDetailRow('Coordinator', region.coordinator),
                  _buildDetailRow('Phone', region.phone),
                  _buildDetailRow('Email', region.email),
                  _buildDetailRow('Address', region.address),
                  _buildDetailRow(
                    'Beneficiaries',
                    region.beneficiaryCount.toString(),
                  ),
                  _buildDetailRow(
                    'Distributors',
                    region.distributorCount.toString(),
                  ),
                  _buildDetailRow(
                    'Active Projects',
                    region.activeProjects.toString(),
                  ),
                  _buildDetailRow(
                    'Last Activity',
                    _formatDate(region.lastActivity),
                  ),
                  const SizedBox(height: 8),
                  MainText(
                    context.l10n.description,
                    fontWeight: FontWeight.w500,
                  ),

                  const SizedBox(height: 4),
                  MainText(region.description),
                  const SizedBox(height: 12),
                  MainText(
                    context.l10n.disttricts,
                    fontWeight: FontWeight.w500,
                  ),

                  const SizedBox(height: 4),
                  ...region.districts.map(
                    (district) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: MainText('• $district'),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: MainText(context.l10n.close),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  onEdit(region);
                },
                child: MainText(context.l10n.edit),
              ),
            ],
          ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.black87)),
          ),
        ],
      ),
    );
  }
}
