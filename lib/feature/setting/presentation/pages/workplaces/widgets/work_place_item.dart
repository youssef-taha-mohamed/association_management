import 'package:flutter/material.dart';

import '../workplaces.dart';

class WorkplaceCard extends StatelessWidget {
  const WorkplaceCard({super.key, required this.workplace});

  final Workplace workplace;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => _showWorkplaceDetails(context, workplace),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: _getTypeColor(
                        workplace.type,
                      ).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getTypeIcon(workplace.type),
                      color: _getTypeColor(workplace.type),
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                workplace.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
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
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: _getTypeColor(workplace.type),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                workplace.type,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Est. ${workplace.establishedYear}',
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 12,
                              ),
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
                            value: 'view',
                            child: Row(
                              children: [
                                Icon(
                                  Icons.visibility,
                                  size: 20,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 8),
                                Text('View Details'),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 'edit',
                            child: Row(
                              children: [
                                Icon(Icons.edit, size: 20, color: Colors.green),
                                SizedBox(width: 8),
                                Text('Edit'),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 'employees',
                            child: Row(
                              children: [
                                Icon(
                                  Icons.people,
                                  size: 20,
                                  color: Colors.orange,
                                ),
                                SizedBox(width: 8),
                                Text('View Employees'),
                              ],
                            ),
                          ),
                        ],
                    onSelected: (value) {
                      if (value == 'view') {
                        _showWorkplaceDetails(context, workplace);
                      }
                      if (value == 'edit') _editWorkplace(context,workplace);
                      if (value == 'employees') {
                        _viewEmployees(context, workplace);
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                workplace.description,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: Colors.grey.shade500,
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      workplace.location,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.people, size: 16, color: Colors.grey.shade500),
                  SizedBox(width: 4),
                  Text(
                    '${workplace.employeeCount} employees',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                  Spacer(),
                  Icon(Icons.person, size: 16, color: Colors.grey.shade500),
                  SizedBox(width: 4),
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
      case 'ngo':
        return Colors.blue.shade600;
      case 'association':
        return Colors.green.shade600;
      case 'charity':
        return Colors.purple.shade600;
      case 'organization':
        return Colors.orange.shade600;
      default:
        return Colors.grey.shade600;
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type.toLowerCase()) {
      case 'ngo':
        return Icons.public;
      case 'association':
        return Icons.groups;
      case 'charity':
        return Icons.favorite;
      case 'organization':
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
            title: Text(workplace.name),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Type', workplace.type),
                  _buildDetailRow(
                    'Status',
                    workplace.isActive ? 'Active' : 'Inactive',
                  ),
                  _buildDetailRow('Location', workplace.location),
                  _buildDetailRow(
                    'Employees',
                    workplace.employeeCount.toString(),
                  ),
                  _buildDetailRow(
                    'Established',
                    workplace.establishedYear.toString(),
                  ),
                  _buildDetailRow('Contact Person', workplace.contactPerson),
                  _buildDetailRow('Phone', workplace.phone),
                  _buildDetailRow('Email', workplace.email),
                  SizedBox(height: 8),
                  Text(
                    'Description:',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 4),
                  Text(workplace.description),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _editWorkplace(context, workplace);
                },
                child: Text('Edit'),
              ),
            ],
          ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
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
          Expanded(child: Text(value, style: TextStyle(color: Colors.black87))),
        ],
      ),
    );
  }

  void _viewEmployees(BuildContext context, Workplace workplace) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'View employees for ${workplace.name} - Feature coming soon',
        ),
      ),
    );
  }

  void _editWorkplace(BuildContext context, Workplace workplace) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Edit ${workplace.name} - Feature coming soon')),
    );
  }
}
