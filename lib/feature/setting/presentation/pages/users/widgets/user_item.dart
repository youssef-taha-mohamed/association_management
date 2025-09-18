import 'package:flutter/material.dart';
import '../../../cubits/people_data/edit_user_cubit.dart' show User;

class UserItem extends StatelessWidget {
  const UserItem({super.key, required this.user, required this.editUser});

  final void Function(User user) editUser;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
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
                  onTap: () => editUser(user),
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
}
