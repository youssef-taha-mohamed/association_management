import 'package:flutter/material.dart';

import '../../../../domain/entities/distributors.dart';

class DistributorCard extends StatelessWidget {
  final Distributor distributor;
  final Function(Distributor) onView;
  final Function(Distributor) onEdit;
  final Function(Distributor) onSchedule;
  final Function(Distributor) onContact;
  final Function(Distributor) onDeactivate;

  const DistributorCard({
    super.key,
    required this.distributor,
    required this.onView,
    required this.onEdit,
    required this.onSchedule,
    required this.onContact,
    required this.onDeactivate,
  });


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
        border: distributor.status != 'Active'
            ? Border.all(color: Colors.grey.shade300, width: 1)
            : null,
      ),
      child: InkWell(
        onTap: () => onView(distributor),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Hero(
                    tag: 'avatar_${distributor.id}',
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: _getStatusColor(distributor.status).withOpacity(0.2),
                      child: Text(
                        distributor.avatar,
                        style: TextStyle(
                          color: _getStatusColor(distributor.status),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
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
                              child: Text(
                                distributor.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: distributor.status == 'Active' ? Colors.black87 : Colors.grey.shade600,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: _getStatusColor(distributor.status),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                distributor.status,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 14, color: Colors.grey.shade500),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                distributor.region,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: _getAvailabilityColor(distributor.availabilityStatus).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                distributor.availabilityStatus,
                                style: TextStyle(
                                  color: _getAvailabilityColor(distributor.availabilityStatus),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.star, size: 14, color: Colors.amber),
                                const SizedBox(width: 2),
                                Text(
                                  distributor.rating.toString(),
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16),
                            Row(
                              children: [
                                Icon(Icons.delivery_dining, size: 14, color: Colors.grey.shade500),
                                const SizedBox(width: 4),
                                Text(
                                  '${distributor.totalDistributions} deliveries',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton(
                    icon: Icon(Icons.more_vert, color: Colors.grey.shade400),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'view',
                        child: Row(
                          children: [
                            Icon(Icons.visibility, size: 20, color: Colors.blue),
                            SizedBox(width: 8),
                            Text('View Profile'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit, size: 20, color: Colors.green),
                            SizedBox(width: 8),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'schedule',
                        child: Row(
                          children: [
                            Icon(Icons.schedule, size: 20, color: Colors.orange),
                            SizedBox(width: 8),
                            Text('Schedule Delivery'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'contact',
                        child: Row(
                          children: [
                            Icon(Icons.phone, size: 20, color: Colors.blue),
                            SizedBox(width: 8),
                            Text('Contact'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'deactivate',
                        child: Row(
                          children: [
                            Icon(Icons.block, size: 20, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Deactivate'),
                          ],
                        ),
                      ),
                    ],
                    onSelected: (value) {
                      if (value == 'view') onView(distributor);
                      if (value == 'edit') onEdit(distributor);
                      if (value == 'schedule') onSchedule(distributor);
                      if (value == 'contact') onContact(distributor);
                      if (value == 'deactivate') onDeactivate(distributor);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(Icons.email, size: 14, color: Colors.grey.shade500),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  distributor.email,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Row(
                          children: [
                            Icon(Icons.phone, size: 14, color: Colors.grey.shade500),
                            const SizedBox(width: 4),
                            Text(
                              distributor.phone,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.work, size: 14, color: Colors.grey.shade500),
                            const SizedBox(width: 4),
                            Text(
                              distributor.experience,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Row(
                          children: [
                            Icon(Icons.directions_car, size: 14, color: Colors.grey.shade500),
                            const SizedBox(width: 4),
                            Text(
                              distributor.vehicleType,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          'Last: ${_formatDate(distributor.lastDistribution)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (distributor.nextScheduledDistribution != null) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.schedule, size: 12, color: Colors.blue.shade600),
                      const SizedBox(width: 4),
                      Text(
                        'Next delivery: ${_formatDateTime(distributor.nextScheduledDistribution!)}',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green.shade600;
      case 'on leave':
        return Colors.orange.shade600;
      case 'inactive':
        return Colors.red.shade600;
      default:
        return Colors.grey.shade600;
    }
  }

  Color _getAvailabilityColor(String availability) {
    switch (availability.toLowerCase()) {
      case 'available':
        return Colors.green;
      case 'busy':
        return Colors.orange;
      case 'on leave':
        return Colors.blue;
      case 'unavailable':
        return Colors.red;
      default:
        return Colors.grey;
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

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final dateToCompare = DateTime(dateTime.year, dateTime.month, dateTime.day);

    final time = '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';

    if (dateToCompare == today) {
      return 'Today $time';
    } else if (dateToCompare == tomorrow) {
      return 'Tomorrow $time';
    } else {
      final difference = dateToCompare.difference(today);
      return '${difference.inDays}d later';
    }
  }
}