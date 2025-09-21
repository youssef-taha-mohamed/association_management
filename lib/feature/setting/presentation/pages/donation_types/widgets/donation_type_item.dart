import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';

import '../../../../../../core/style/app_colors.dart';
import '../../../../../../shared/widgets/main_text.dart';
import '../donation_types.dart';

class DonationTypeCard extends StatelessWidget {
  const DonationTypeCard({
    super.key,
    required this.donationType,
    required this.duplicateDonationType,
    required this.deleteDonationType,
    required this.toggleDonationTypeStatus,
    required this.editDonationType,
  });

  final DonationType donationType;
  final VoidCallback duplicateDonationType;
  final VoidCallback deleteDonationType;
  final VoidCallback toggleDonationTypeStatus;
  final VoidCallback editDonationType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
        border:
            donationType.isActive
                ? null
                : Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: InkWell(
        onTap: () => _showDonationTypeDetails(context, donationType),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: donationType.color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      donationType.icon,
                      color: donationType.color,
                      size: 28,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: MainText(
                                donationType.name,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color:
                                    donationType.isActive
                                        ? Colors.black87
                                        : Colors.grey.shade600,
                              ),
                            ),
                            if (!donationType.isActive)
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: MainText(
                                  context.l10n.inactive,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 4),
                        MainText(
                          donationType.description,
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: donationType.color.withValues(
                                  alpha: 0.2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: MainText(
                                donationType.category,
                                color: donationType.color,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            SizedBox(width: 8),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: MainText(
                                '\$${donationType.estimatedValue.toStringAsFixed(0)} / ${donationType.unit}',
                                color: Colors.green.shade700,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert, color: Colors.grey.shade400),
                    onSelected: (value) {
                      if (value == context.l10n.view) {
                        _showDonationTypeDetails(context, donationType);
                      } else if (value == context.l10n.edit) {
                        editDonationType(); // استدعاء الدالة الجديدة
                      } else if (value == context.l10n.duplicate) {
                        duplicateDonationType();
                      } else if (value == context.l10n.toggle) {
                        toggleDonationTypeStatus();
                      } else if (value == context.l10n.delete) {
                        deleteDonationType();
                      }
                    },
                    itemBuilder:
                        (context) => [
                          PopupMenuItem(
                            value: context.l10n.view,
                            child: Row(
                              spacing: 8,
                              children: [
                                Icon(
                                  Icons.visibility,
                                  size: 20,
                                  color: Colors.blue,
                                ),
                                MainText(context.l10n.view_details),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: context.l10n.edit,
                            child: Row(
                              spacing: 8,
                              children: [
                                Icon(Icons.edit, size: 20, color: Colors.green),
                                MainText(context.l10n.edit),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: context.l10n.duplicate,
                            child: Row(
                              spacing: 8,
                              children: [
                                Icon(
                                  Icons.copy,
                                  size: 20,
                                  color: Colors.orange,
                                ),
                                MainText(context.l10n.duplicate),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: context.l10n.toggle,
                            child: Row(
                              spacing: 8,
                              children: [
                                Icon(
                                  donationType.isActive
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  size: 20,
                                  color:
                                      donationType.isActive
                                          ? Colors.orange
                                          : Colors.green,
                                ),
                                MainText(
                                  donationType.isActive
                                      ? context.l10n.deactivate
                                      : context.l10n.activate,
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: context.l10n.delete,
                            child: Row(
                              spacing: 8,
                              children: [
                                Icon(
                                  Icons.delete,
                                  size: 20,
                                  color: AppColors.red,
                                ),
                                MainText(context.l10n.delete),
                              ],
                            ),
                          ),
                        ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.favorite, size: 16, color: Colors.grey.shade500),
                  SizedBox(width: 4),
                  MainText(
                    '${donationType.donationsCount} ${context.l10n.donations}',
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                  Spacer(),
                  MainText(
                    '${context.l10n.last}${_formatDate(donationType.lastDonation)}',
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ],
              ),
              SizedBox(height: 8),
              MainText(
                '${context.l10n.items} ${donationType.items.take(3).join(", ")}${donationType.items.length > 3 ? "..." : ""}',
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDonationTypeDetails(
    BuildContext context,
    DonationType donationType,
  ) {
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
                    color: donationType.color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    donationType.icon,
                    color: donationType.color,
                    size: 20,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(child: Text(donationType.name)),
              ],
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow(context.l10n.category, donationType.category),
                  _buildDetailRow(
                    context.l10n.status,
                    donationType.isActive
                        ? context.l10n.active
                        : context.l10n.inactive,
                  ),
                  _buildDetailRow(context.l10n.unit, donationType.unit),
                  _buildDetailRow(
                    context.l10n.estimated_value,
                    '\${donationType.estimatedValue.toStringAsFixed(2)}',
                  ),
                  _buildDetailRow(
                    context.l10n.total_donations,
                    donationType.donationsCount.toString(),
                  ),
                  _buildDetailRow(
                    context.l10n.last_donation,
                    _formatDate(donationType.lastDonation),
                  ),
                  SizedBox(height: 8),
                  MainText(
                    context.l10n.description,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 4),
                  MainText(donationType.description),
                  SizedBox(height: 12),
                  MainText(
                    context.l10n.typical_items,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 4),
                  ...donationType.items.map(
                    (item) => Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: MainText('• $item'),
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
                  editDonationType();
                },
                child: MainText(context.l10n.edit),
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
            child: MainText(
              '$label:',
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),

          Expanded(child: MainText(value, color: Colors.black87)),
        ],
      ),
    );
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
}
