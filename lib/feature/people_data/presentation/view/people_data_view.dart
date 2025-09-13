import 'package:flutter/material.dart';
import 'package:management/core/style/app_colors.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_text.dart';

import '../cubit/edit_user_cubit.dart';
import 'edit_user.dart';

class PeopleDataView extends StatefulWidget {
  const PeopleDataView({super.key});

  static const routeName = '/people_data';

  @override
  State<PeopleDataView> createState() => _PeopleDataViewState();
}

class _PeopleDataViewState extends State<PeopleDataView> {
  List<User> users = [
    User(
      id: 'hgut',
      name: 'Mohamedkamal',
      department: 'جهة A',
      role: 'Operator',
      password: '••••••••••',
      isActive: true,
    ),
    User(
      id: 'ufjg',
      name: 'admin',
      department: 'جهة A',
      role: 'Admin',
      password: '••••',
      isActive: true,
    ),
  ];

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<User> filteredUsers =
        users.where((user) {
          return user.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              user.department.toLowerCase().contains(
                _searchQuery.toLowerCase(),
              ) ||
              user.role.toLowerCase().contains(_searchQuery.toLowerCase());
        }).toList();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.close, color: Colors.grey[600], size: 24),
              ),
            ),
            MainText(
              'بيانات المستخدمين',

                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w600,

            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.person, color: Colors.blue, size: 24),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                // Add User Button
                Container(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => _showAddUserBottomSheet(context),
                    icon: Icon(Icons.person_add, color: Colors.white, size: 20),
                    label: MainText(
                      'إضافة مستخدم جديد',

                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,

                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: _searchController,
                    textAlign: TextAlign.right,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'انتقال الى...',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey[500],
                        size: 20,
                      ),
                      suffixIcon:
                          _searchQuery.isNotEmpty
                              ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    _searchController.clear();
                                    _searchQuery = '';
                                  });
                                },
                                icon: Icon(
                                  Icons.clear,
                                  color: Colors.grey[500],
                                  size: 18,
                                ),
                              )
                              : null,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Users List - Card Style for Mobile
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (context, index) {
                  final user = filteredUsers[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[200]!),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Header Row - Name and Edit
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => _editUser(user),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                    size: 18,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  user.name,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),

                          // User Details
                          _buildDetailRow('كلمة السر', user.password),
                          SizedBox(height: 12),
                          _buildDetailRow(
                            'نوع الصلاحية',
                            '',
                            badge: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    user.role == 'Admin'
                                        ? Colors.orange[100]
                                        : Colors.blue[100],
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color:
                                      user.role == 'Admin'
                                          ? Colors.orange[300]!
                                          : Colors.blue[300]!,
                                ),
                              ),
                              child: Text(
                                user.role,
                                style: TextStyle(
                                  fontSize: 12,
                                  color:
                                      user.role == 'Admin'
                                          ? Colors.orange[800]
                                          : Colors.blue[800],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          _buildDetailRow('اسم الجهة', user.department),
                          SizedBox(height: 12),
                          _buildDetailRow(
                            'حالة التفعيل',
                            '',
                            badge: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    user.isActive
                                        ? Colors.green[100]
                                        : Colors.red[100],
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color:
                                      user.isActive
                                          ? Colors.green[300]!
                                          : Colors.red[300]!,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    user.isActive
                                        ? Icons.check_circle
                                        : Icons.cancel,
                                    size: 16,
                                    color:
                                        user.isActive
                                            ? Colors.green[700]
                                            : Colors.red[700],
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    user.isActive ? 'مفعل' : 'غير مفعل',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          user.isActive
                                              ? Colors.green[800]
                                              : Colors.red[800],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Footer
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey[200]!)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'إجمالي: ${filteredUsers.length}',
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  '${filteredUsers.length} - 1',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Widget? badge}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        badge ??
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                letterSpacing: value.contains('••') ? 2 : 0,
              ),
            ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  void _editUser(User user) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.edit, color: Colors.blue),
                MainText(
                  'تعديل المستخدم',
                  fontSize: 18, fontWeight: FontWeight.w600
                ),
              ],
            ),
            content: MainText(
              'سيتم فتح شاشة تعديل المستخدم: ${user.name}',
              textAlign: TextAlign.right,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditUserFullScreen(user: user),
                    ),
                  ).then((updatedUser) {
                    if (updatedUser != null) {
                      setState(() {
                        // Update the user in your users list
                        int index = users.indexWhere((u) => u.id == updatedUser.id);
                        if (index != -1) {
                          users[index] = updatedUser;
                        }
                      });
                    }
                  });
                },
                child:MainText('موافق'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
            ],
          ),
    );
  }

  void _showAddUserBottomSheet(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _passwordController = TextEditingController();
    String _selectedRole = 'Operator';
    String _selectedDepartment = 'جهة A';
    bool _isActive = true;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => StatefulBuilder(
            builder:
                (context, setModalState) => Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Header
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue, Colors.blue[700]!],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            MainText(
                              'إدخال بيانات المستخدمين',
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,

                            ),
                            Icon(
                              Icons.person_add,
                              color: AppColors.white,
                              size: 24,
                            ),
                          ],
                        ),
                      ),

                      // Form
                      Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(24),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Username Field
                                _buildFormField(
                                  controller: _nameController,
                                  label: context.l10n.name,
                                  icon: Icons.person_outline,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return context.l10n.name_required;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 24),

                                // Password Field
                                _buildFormField(
                                  controller: _passwordController,
                                  label: context.l10n.password,
                                  icon: Icons.lock_outline,
                                  isPassword: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return context.l10n.password_required;
                                    }
                                    if (value.length < 4) {
                                      return 'كلمة السر يجب أن تكون 4 أحرف على الأقل';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 24),

                                // Role Dropdown
                                _buildDropdownField(
                                  value: _selectedRole,
                                  label: context.l10n.type_of_validity,
                                  icon: Icons.admin_panel_settings_outlined,
                                  items: ['Operator', 'Admin', 'User'],
                                  onChanged: (value) {
                                    setModalState(() {
                                      _selectedRole = value!;
                                    });
                                  },
                                ),
                                SizedBox(height: 24),

                                // Department Dropdown
                                _buildDropdownField(
                                  value: _selectedDepartment,
                                  label: 'اسم الجهة',
                                  icon: Icons.business_outlined,
                                  items: ['جهة A', 'جهة B', 'جهة C'],
                                  onChanged: (value) {
                                    setModalState(() {
                                      _selectedDepartment = value!;
                                    });
                                  },
                                ),
                                SizedBox(height: 24),

                                // Active Status
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                    border: Border.all(
                                      color: Colors.grey[200]!,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Switch(
                                        value: _isActive,
                                        onChanged: (value) {
                                          setModalState(() {
                                            _isActive = value;
                                          });
                                        },
                                        activeColor: Colors.blue,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'حالة التفعيل',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Icon(
                                            Icons.toggle_on_outlined,
                                            color: Colors.grey[600],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 40),

                                // Buttons
                                Row(
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text(
                                          'إلغاء',
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        style: OutlinedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 16,
                                          ),
                                          side: BorderSide(
                                            color: Colors.grey[300]!,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              users.add(
                                                User(
                                                  id: 'hgyt',
                                                  name: _nameController.text,
                                                  department:
                                                      _selectedDepartment,
                                                  role: _selectedRole,
                                                  password: '••••••••',
                                                  isActive: _isActive,
                                                ),
                                              );
                                            });
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.check_circle,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(width: 8),
                                                    Text(
                                                      'تم إضافة المستخدم بنجاح',
                                                    ),
                                                  ],
                                                ),
                                                backgroundColor: Colors.green,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                margin: EdgeInsets.all(16),
                                              ),
                                            );
                                          }
                                        },
                                        child: Text(
                                          'إضافة',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                          padding: EdgeInsets.symmetric(
                                            vertical: 16,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          elevation: 2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      textAlign: TextAlign.right,
      validator: validator,
      style: TextStyle(fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
        prefixIcon: Icon(icon, color: Colors.grey[500], size: 22),
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red[300]!),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      ),
    );
  }

  Widget _buildDropdownField({
    required String value,
    required String label,
    required IconData icon,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      style: TextStyle(fontSize: 16, color: Colors.black87),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
        prefixIcon: Icon(icon, color: Colors.grey[500], size: 22),
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      ),
      items:
          items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 16),
              ),
            );
          }).toList(),
    );
  }
}
