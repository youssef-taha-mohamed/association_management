import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_text.dart';

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
      name: 'Administrator',
      description: 'Full access to all features',
      userCount: 5,
      permissions: ['All Permissions'],
      color: Colors.red.shade100,
    ),
    UserRole(
      id: '2',
      name: 'Manager',
      description: 'Manage operations and staff',
      userCount: 12,
      permissions: ['Manage Users', 'View Reports', 'Manage Donations'],
      color: Colors.blue.shade100,
    ),
    UserRole(
      id: '3',
      name: 'Staff',
      description: 'Handle daily operations',
      userCount: 35,
      permissions: ['Manage Beneficiaries', 'Record Distributions'],
      color: Colors.green.shade100,
    ),
    UserRole(
      id: '4',
      name: 'Volunteer',
      description: 'Assist with distributions',
      userCount: 128,
      permissions: ['View Beneficiaries', 'Record Distributions'],
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
          IconButton(icon: Icon(Icons.search, color: AppColors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert,color: AppColors.white), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Manage roles and permissions for your organization',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
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
        child: Icon(Icons.add, color: Colors.white),
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
            title: Text('Add New Role'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Role Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: descController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
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
                child: Text('Add'),
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
