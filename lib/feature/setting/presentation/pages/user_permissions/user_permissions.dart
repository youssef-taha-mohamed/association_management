import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_text.dart';
import 'package:management/shared/widgets/main_textfield.dart';

import '../../../../../core/style/app_colors.dart';
import 'widgets/roal_card.dart';

class UserPermissionsPage extends StatefulWidget {
  static const String routeName = 'user_permissions';

  const UserPermissionsPage({super.key});

  @override
  State<UserPermissionsPage> createState() => _UserPermissionsPageState();
}

class _UserPermissionsPageState extends State<UserPermissionsPage> {
  List<UserRole> roles = [
    UserRole(
      id: '1',
      name: 'مسؤول النظام',
      description: 'وصول كامل إلى جميع المزايا',
      userCount: 5,
      permissions: ['جميع الصلاحيات'],
      color: Colors.red.shade100,
    ),
    UserRole(
      id: '2',
      name: 'مدير',
      description: 'إدارة العمليات والموظفين',
      userCount: 12,
      permissions: ['إدارة المستخدمين', 'عرض التقارير', 'إدارة التبرعات'],
      color: Colors.blue.shade100,
    ),
    UserRole(
      id: '3',
      name: 'موظف',
      description: 'التعامل مع العمليات اليومية',
      userCount: 35,
      permissions: ['إدارة المستفيدين', 'تسجيل التوزيعات'],
      color: Colors.green.shade100,
    ),
    UserRole(
      id: '4',
      name: 'متطوع',
      description: 'المساعدة في التوزيعات',
      userCount: 128,
      permissions: ['عرض المستفيدين', 'تسجيل التوزيعات'],
      color: Colors.orange.shade100,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: MainText(
          context.l10n.user_permissions,
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
            icon: Icon(Icons.search, color: AppColors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: AppColors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.white,
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: MainText(
                    context.l10n.manage_roles_permissions_your_organization,
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: roles.length,
              itemBuilder: (context, index) {
                return RoleCardWidget(
                  role: roles[index],
                  deleteRole: _deleteRole,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddRoleDialog(),
        backgroundColor: Colors.blue.shade600,
        child: Icon(Icons.add, color: AppColors.white),
      ),
    );
  }

  void _showAddRoleDialog() {
    final nameController = TextEditingController();
    final descController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: MainText(context.l10n.add_new_role),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MainTextField(
                  controller: nameController,

                  label: context.l10n.role_name,
                ),
                SizedBox(height: 16),
                MainTextField(
                  controller: descController,
                  label: context.l10n.description,
                  maxLines: 2,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: MainText(context.l10n.cancel),
              ),
              ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty) {
                    setState(() {
                      roles.add(
                        UserRole(
                          id: DateTime.now().toString(),
                          name: nameController.text,
                          description: descController.text,
                          userCount: 0,
                          permissions: [],
                          color: Colors.grey.shade100,
                        ),
                      );
                    });
                    Navigator.pop(context);
                  }
                },
                child: MainText(context.l10n.add),
              ),
            ],
          ),
    );
  }

  void _deleteRole(UserRole role) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Delete Role'),
            content: Text('Are you sure you want to delete "${role.name}"?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    roles.removeWhere((r) => r.id == role.id);
                  });
                  Navigator.pop(context);
                },
                child: Text('Delete'),
              ),
            ],
          ),
    );
  }
}

class UserRole {
  final String id;
  final String name;
  final String description;
  final int userCount;
  final List<String> permissions;
  final Color color;

  UserRole({
    required this.id,
    required this.name,
    required this.description,
    required this.userCount,
    required this.permissions,
    required this.color,
  });
}
