import 'package:flutter/material.dart';

import '../beneficiaries_dep.dart';

class BeneficiaryCard extends StatelessWidget {
  const BeneficiaryCard({super.key, required this.beneficiary});

  final Beneficiary beneficiary;

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
        onTap: () => _showBeneficiaryDetails(context,beneficiary),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: _getCategoryColor(beneficiary.category),
                    child: Text(
                      beneficiary.name
                          .split(' ')
                          .map((n) => n[0])
                          .take(2)
                          .join()
                          .toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          beneficiary.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
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
                                color: _getCategoryColor(beneficiary.category),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                beneficiary.category,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(width: 6),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: _getStatusColor(beneficiary.status),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                beneficiary.status,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
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
                            value: 'view',
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.edit, size: 20, color: Colors.green),
                                SizedBox(width: 8),
                                Text('Edit'),
                              ],
                            ),
                            value: 'edit',
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.card_giftcard,
                                  size: 20,
                                  color: Colors.orange,
                                ),
                                SizedBox(width: 8),
                                Text('Add Distribution'),
                              ],
                            ),
                            value: 'distribute',
                          ),
                        ],
                    onSelected: (value) {
                      if (value == 'view') _showBeneficiaryDetails(context,beneficiary);
                      if (value == 'edit') _editBeneficiary(context,beneficiary);
                      if (value == 'distribute') _addDistribution(context,beneficiary);
                    },
                  ),
                ],
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
                  Text(
                    beneficiary.location,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                  SizedBox(width: 16),
                  Icon(
                    Icons.family_restroom,
                    size: 16,
                    color: Colors.grey.shade500,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '${beneficiary.dependents} dependents',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.phone, size: 16, color: Colors.grey.shade500),
                  SizedBox(width: 4),
                  Text(
                    beneficiary.phone,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                  Spacer(),
                  Text(
                    'Income: \$${beneficiary.monthlyIncome.toStringAsFixed(0)}',
                    style: TextStyle(
                      color: Colors.green.shade600,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              if (beneficiary.lastDistribution != null) ...[
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: Colors.grey.shade500,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Last distribution: ${formatDate(beneficiary.lastDistribution!)}',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'family':
        return Colors.blue.shade600;
      case 'elderly':
        return Colors.purple.shade600;
      case 'orphan':
        return Colors.orange.shade600;
      case 'disabled':
        return Colors.teal.shade600;
      default:
        return Colors.grey.shade600;
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green.shade600;
      case 'pending':
        return Colors.orange.shade600;
      case 'inactive':
        return Colors.red.shade600;
      default:
        return Colors.grey.shade600;
    }
  }

  void _showBeneficiaryDetails(BuildContext context, Beneficiary beneficiary) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(beneficiary.name),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Category', beneficiary.category),
                  _buildDetailRow('Status', beneficiary.status),
                  _buildDetailRow('Location', beneficiary.location),
                  _buildDetailRow('Phone', beneficiary.phone),
                  _buildDetailRow(
                    'Dependents',
                    beneficiary.dependents.toString(),
                  ),
                  _buildDetailRow(
                    'Monthly Income',
                    '\${beneficiary.monthlyIncome.toStringAsFixed(2)}',
                  ),
                  if (beneficiary.lastDistribution != null)
                    _buildDetailRow(
                      'Last Distribution',
                      formatDate(beneficiary.lastDistribution!),
                    ),
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
                  _editBeneficiary(context,beneficiary);
                },
                child: Text('Edit'),
              ),
            ],
          ),
    );
  }

  void _editBeneficiary(BuildContext context, Beneficiary beneficiary) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Edit ${beneficiary.name} - Feature coming soon')),
    );
  }

  void _addDistribution(BuildContext context, Beneficiary beneficiary) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Add distribution for ${beneficiary.name} - Feature coming soon',
        ),
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
}

String formatDate(DateTime date) {
  final now = DateTime.now();
  final difference = now.difference(date).inDays;

  if (difference == 0) {
    return 'Today';
  } else if (difference == 1) {
    return 'Yesterday';
  } else if (difference < 7) {
    return '$difference days ago';
  } else if (difference < 30) {
    return '${(difference / 7).floor()} weeks ago';
  } else {
    return '${(difference / 30).floor()} months ago';
  }
}
