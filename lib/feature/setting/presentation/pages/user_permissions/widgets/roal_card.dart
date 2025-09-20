import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_text.dart';
import '../../../../../../core/style/app_colors.dart';
import '../user_permissions.dart';

class RoleCardWidget extends StatelessWidget {
  const RoleCardWidget({
    super.key,
    required this.role,
    required this.deleteRole,
  });

  final void Function(UserRole) deleteRole;
  final UserRole role;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => _showRoleDetails(context, role),
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
                      color: role.color,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getRoleIcon(role.name),
                      color: _getRoleIconColor(role.name),
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainText(
                          role.name,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        SizedBox(height: 4),
                        MainText(
                          role.description,
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton(
                    icon: Icon(Icons.more_vert, color: Colors.grey.shade400),
                    itemBuilder:
                        (context) => [
                          PopupMenuItem(
                            value: context.l10n.edit,
                            child: Row(
                              children: [
                                Icon(Icons.edit, size: 20, color: Colors.blue),
                                SizedBox(width: 8),
                                MainText(context.l10n.edit),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: context.l10n.delete,
                            child: Row(
                              children: [
                                Icon(Icons.delete, size: 20, color: Colors.red),
                                SizedBox(width: 8),
                                MainText(context.l10n.delete),
                              ],
                            ),
                          ),
                        ],
                    onSelected: (value) {
                      if (value == context.l10n.edit) _editRole(context, role);
                      if (value == context.l10n.delete) deleteRole(role);
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: MainText(
                      '${role.userCount} users',

                      color: Colors.blue.shade700,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: MainText(
                      '${role.permissions.length} permissions',
                      color: Colors.green.shade700,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              MainText(
                'Permissions: ${role.permissions.join(", ")}',
                fontSize: 13,
                color: Colors.grey.shade600,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getRoleIcon(String roleName) {
    switch (roleName.toLowerCase()) {
      case 'مسؤول النظام':
        return Icons.admin_panel_settings;
      case 'مدير':
        return Icons.business_center;
      case 'موظف':
        return Icons.person;
      case 'متطوع':
        return Icons.volunteer_activism;
      default:
        return Icons.person;
    }
  }

  Color _getRoleIconColor(String roleName) {
    switch (roleName.toLowerCase()) {
      case 'مسؤول النظام':
        return Colors.red.shade600;
      case 'مدير':
        return Colors.blue.shade600;
      case 'موظف':
        return Colors.green.shade600;
      case 'متطوع':
        return Colors.orange.shade600;
      default:
        return Colors.grey.shade600;
    }
  }

  void _showRoleDetails(BuildContext context, UserRole role) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(role.name),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainText('Description: ${role.description}'),
                SizedBox(height: 8),
                MainText('Users: ${role.userCount}'),
                SizedBox(height: 8),
                MainText('Permissions:'),
                ...role.permissions.map((p) => MainText('• $p')),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: MainText(context.l10n.close),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _editRole(context, role);
                },
                child: MainText(context.l10n.edit),
              ),
            ],
          ),
    );
  }

  void _editRole(BuildContext context, UserRole role) {
    // Implementation for editing role
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: MainText('Edit ${role.name} - Feature coming soon')),
    );
  }
}
