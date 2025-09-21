import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';

import '../../../../../core/style/app_colors.dart';
import '../../../../../shared/widgets/main_text.dart';
import '../../../domain/entities/distributors.dart';
import 'edit_distributor.dart';

class DistributorDetailsPage extends StatelessWidget {
  final Distributor distributor;

  const DistributorDetailsPage({super.key, required this.distributor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: MainText(context.l10n.distributor_profile),
        backgroundColor: AppColors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          EditDistributorForm(distributor: distributor),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(context),
            const SizedBox(height: 16),
            _buildInfoSection(context),
            const SizedBox(height: 16),
            _buildStatsSection(context),
            const SizedBox(height: 16),
            _buildSpecializationSection(context),
            const SizedBox(height: 16),
            _buildContactSection(context),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Hero(
              tag: '${context.l10n.avatar}${distributor.id}',
              child: CircleAvatar(
                radius: 50,
                backgroundColor: _getStatusColor(
                  distributor.status,
                ).withOpacity(0.2),
                child: MainText(
                  distributor.avatar,

                  color: _getStatusColor(distributor.status),
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            const SizedBox(height: 16),
            MainText(
              distributor.name,

              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            const SizedBox(height: 4),
            MainText(
              distributor.region,
              fontSize: 16,
              color: Colors.grey.shade600,
            ),

            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(distributor.status),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: MainText(
                    distributor.status,

                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getAvailabilityColor(
                      distributor.availabilityStatus,
                    ).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: _getAvailabilityColor(
                        distributor.availabilityStatus,
                      ),
                    ),
                  ),
                  child: MainText(
                    distributor.availabilityStatus,

                    color: _getAvailabilityColor(
                      distributor.availabilityStatus,
                    ),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProfileStat(
                  context.l10n.rating,
                  distributor.rating.toString(),
                  Icons.star,
                  Colors.amber,
                ),
                _buildProfileStat(
                  context.l10n.experience,
                  distributor.experience,
                  Icons.work,
                  AppColors.blue,
                ),
                _buildProfileStat(
                  context.l10n.deliveries,
                  distributor.totalDistributions.toString(),
                  Icons.delivery_dining,
                  AppColors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileStat(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        MainText(
          value,

          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        MainText(label, fontSize: 12, color: Colors.grey.shade600),
      ],
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainText(
            context.l10n.contact_details,

            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          const SizedBox(height: 16),
          _buildInfoRow(context.l10n.email, distributor.email, Icons.email),
          _buildInfoRow(context.l10n.phone, distributor.phone, Icons.phone),
          _buildInfoRow(context.l10n.address, distributor.address, Icons.home),
          _buildInfoRow(
            context.l10n.vehicle_type,
            distributor.vehicleType,
            Icons.directions_car,
          ),
          _buildInfoRow(
            context.l10n.emergency_contact,
            distributor.emergencyContact,
            Icons.emergency,
          ),
          _buildInfoRow(
            context.l10n.join_date,
            _formatJoinDate(distributor.joinDate),
            Icons.calendar_today,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade500),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainText(
                  label,

                  fontSize: 12,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),

                MainText(value, fontSize: 14, color: Colors.black87),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainText(
            context.l10n.performance_statistics,

            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context.l10n.total_deliveries,
                  distributor.totalDistributions.toString(),
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context.l10n.average_rating,
                  distributor.rating.toString(),
                  Colors.amber,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context.l10n.experience,
                  distributor.experience,
                  Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context.l10n.last_delivery,
                  _formatLastDelivery(distributor.lastDistribution),
                  Colors.purple,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainText(
            title,

            fontSize: 12,
            color: color.withOpacity(0.8),
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 4),
          MainText(
            value,

            fontSize: 18,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Widget _buildSpecializationSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainText(
            context.l10n.specializations_languages,

            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          const SizedBox(height: 16),
          MainText(
            context.l10n.specializations,

            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade700,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                distributor.specialization
                    .map(
                      (spec) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: MainText(
                          spec,

                          color: Colors.blue.shade700,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                    .toList(),
          ),
          const SizedBox(height: 16),
          MainText(
            context.l10n.languages,

            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade700,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                distributor.languages
                    .map(
                      (lang) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.green.shade200),
                        ),
                        child: Text(
                          lang,
                          style: TextStyle(
                            color: Colors.green.shade700,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: MainText(
                      '${context.l10n.calling} ${distributor.phone}...',
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.phone),
              label: MainText(context.l10n.call),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: MainText(
                      '${context.l10n.opening_email_to}${distributor.email}...',
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.email),
              label: MainText(context.l10n.email),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'نشيط':
        return Colors.green.shade600;
      case 'في إجازة':
        return Colors.orange.shade600;
      case 'غير نشط':
        return Colors.red.shade600;
      default:
        return Colors.grey.shade600;
    }
  }

  Color _getAvailabilityColor(String availability) {
    switch (availability.toLowerCase()) {
      case 'متاح':
        return Colors.green;
      case 'مشغول':
        return Colors.orange;
      case 'في إجازة':
        return Colors.blue;
      case 'غير متاح':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatJoinDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _formatLastDelivery(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${(difference.inDays / 7).floor()} weeks ago';
    }
  }
}
