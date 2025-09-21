import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';

import '../../../../../../core/style/app_colors.dart';
import '../../../../../../shared/widgets/main_text.dart';
import '../workplaces.dart';

class WorkplaceCard extends StatelessWidget {
  const WorkplaceCard({
    super.key,
    required this.workplace,
    required this.onEdit,
    required this.onViewEmployees,
  });

  final Workplace workplace;
  final Function(Workplace) onEdit;
  final Function(Workplace) onViewEmployees;

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
      ),
      child: InkWell(
        onTap: () => _showWorkplaceDetails(context, workplace),
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
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: _getTypeColor(workplace.type).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getTypeIcon(workplace.type),
                      color: _getTypeColor(workplace.type),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: MainText(
                                workplace.name,

                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color:
                                    workplace.isActive
                                        ? Colors.green
                                        : Colors.red,
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
                                color: _getTypeColor(workplace.type),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: MainText(
                                workplace.type,

                                color: AppColors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 6),
                            MainText(
                              'Est. ${workplace.establishedYear}',

                              color: Colors.grey.shade500,
                              fontSize: 12,
                            ),
                          ],
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
                                  color: AppColors.blue,
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
                            value: context.l10n.employees,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.people,
                                  size: 20,
                                  color: Colors.orange,
                                ),
                                SizedBox(width: 8),
                                MainText(context.l10n.view_employees),
                              ],
                            ),
                          ),
                        ],
                    onSelected: (value) {
                      if (value == context.l10n.view) {
                        _showWorkplaceDetails(context, workplace);
                      }
                      if (value == context.l10n.edit) onEdit(workplace);
                      if (value == context.l10n.employees)
                        onViewEmployees(workplace);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              MainText(
                workplace.description,
                color: Colors.grey.shade600,
                fontSize: 14,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: Colors.grey.shade500,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: MainText(
                      workplace.location,

                      color: Colors.grey.shade600,
                      fontSize: 13,

                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.people, size: 16, color: Colors.grey.shade500),
                  const SizedBox(width: 4),
                  MainText(
                    '${workplace.employeeCount} ${context.l10n.employees}',
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),

                  const Spacer(),
                  Icon(Icons.person, size: 16, color: Colors.grey.shade500),
                  const SizedBox(width: 4),
                  Text(
                    workplace.contactPerson,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'منظمة غير حكومية':
        return Colors.blue.shade600;
      case 'منظمة':
        return Colors.green.shade600;
      case 'صدقة':
        return Colors.purple.shade600;
      case 'تنظيم':
        return Colors.orange.shade600;
      default:
        return Colors.grey.shade600;
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type.toLowerCase()) {
      case 'منظمة غير حكومية':
        return Icons.public;
      case 'منظمة':
        return Icons.groups;
      case 'صدقة':
        return Icons.favorite;
      case 'تنظيم':
        return Icons.business;
      default:
        return Icons.business;
    }
  }

  void _showWorkplaceDetails(BuildContext context, Workplace workplace) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: MainText(workplace.name),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow(context.l10n.type, workplace.type),
                  _buildDetailRow(
                    context.l10n.status,
                    workplace.isActive
                        ? context.l10n.active
                        : context.l10n.inactive,
                  ),
                  _buildDetailRow(context.l10n.location, workplace.location),
                  _buildDetailRow(
                    context.l10n.employees,
                    workplace.employeeCount.toString(),
                  ),
                  _buildDetailRow(
                    context.l10n.established,
                    workplace.establishedYear.toString(),
                  ),
                  _buildDetailRow(
                    context.l10n.contact_person,
                    workplace.contactPerson,
                  ),
                  _buildDetailRow(context.l10n.phone, workplace.phone),
                  _buildDetailRow(context.l10n.email, workplace.email),
                  const SizedBox(height: 8),
                  MainText(
                    context.l10n.description,
                    fontWeight: FontWeight.w500,
                  ),

                  const SizedBox(height: 4),
                  MainText(workplace.description),
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
                  onEdit(workplace);
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
            child: MainText(
              '$label:',

              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
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
