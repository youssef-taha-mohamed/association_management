import 'package:flutter/material.dart';
import '../beneficiary_categories.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.deleteCategory,
    required this.toggleCategoryStatus,
    required this.editCategory,
  });

  final BeneficiaryCategory category;
  final VoidCallback deleteCategory;
  final VoidCallback toggleCategoryStatus;
  final VoidCallback editCategory;

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
        border:
            category.isActive
                ? null
                : Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: InkWell(
        onTap: () => _showCategoryDetails(context, category),
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
                      color: category.color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(category.icon, color: category.color, size: 28),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                category.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      category.isActive
                                          ? Colors.black87
                                          : Colors.grey.shade600,
                                ),
                              ),
                            ),
                            if (!category.isActive)
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'INACTIVE',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          category.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
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
                                color: _getPriorityColor(
                                  category.priority,
                                ).withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                category.priority,
                                style: TextStyle(
                                  color: _getPriorityColor(category.priority),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                '${category.beneficiaryCount} beneficiaries',
                                style: TextStyle(
                                  color: Colors.blue.shade700,
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
                  PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert, color: Colors.grey.shade400),
                    onSelected: (value) {
                      if (value == 'view') {
                        _showCategoryDetails(context, category);
                      }
                      if (value == 'edit') {
                        editCategory(); // استدعاء الدالة الجديدة
                      }
                      if (value == 'toggle') {
                        toggleCategoryStatus();
                      }
                      if (value == 'delete') {
                        deleteCategory();
                      }
                    },
                    itemBuilder:
                        (context) => [
                          const PopupMenuItem(
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
                          PopupMenuItem(
                            value: 'toggle',
                            child: Row(
                              children: [
                                Icon(
                                  category.isActive
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  size: 20,
                                  color:
                                      category.isActive
                                          ? Colors.orange
                                          : Colors.green,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  category.isActive ? 'Deactivate' : 'Activate',
                                ),
                              ],
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Row(
                              children: [
                                Icon(Icons.delete, size: 20, color: Colors.red),
                                SizedBox(width: 8),
                                Text('Delete'),
                              ],
                            ),
                          ),
                        ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                'Updated ${_formatDate(category.lastUpdated)}',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'critical':
        return Colors.red;
      case 'high':
        return Colors.orange;
      case 'medium':
        return Colors.blue;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;

    if (difference == 0) {
      return 'today';
    } else if (difference == 1) {
      return 'yesterday';
    } else if (difference < 7) {
      return '$difference days ago';
    } else if (difference < 30) {
      return '${(difference / 7).floor()} weeks ago';
    } else {
      return '${(difference / 30).floor()} months ago';
    }
  }

  void _showCategoryDetails(
    BuildContext context,
    BeneficiaryCategory category,
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
                    color: category.color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(category.icon, color: category.color, size: 20),
                ),
                SizedBox(width: 12),
                Expanded(child: Text(category.name)),
              ],
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow(
                    'Status',
                    category.isActive ? 'Active' : 'Inactive',
                  ),
                  _buildDetailRow('Priority', category.priority),
                  _buildDetailRow(
                    'Beneficiaries',
                    category.beneficiaryCount.toString(),
                  ),
                  _buildDetailRow(
                    'Last Updated',
                    _formatDate(category.lastUpdated),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Description:',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 4),
                  Text(category.description),
                  SizedBox(height: 12),
                  Text(
                    'Criteria:',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 4),
                  ...category.criteria.map(
                    (criterion) => Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Text('• $criterion'),
                    ),
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
                  editCategory;
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
}

//
//
// import 'package:flutter/material.dart';
// import '../beneficiary_categories.dart';
//
// class CategoryCard extends StatelessWidget {
//   const CategoryCard({
//     super.key,
//     required this.category,
//     required this.deleteCategory,
//     required this.toggleCategoryStatus,
//     required this.editCategory, // تمت الإضافة
//   });
//
//   final BeneficiaryCategory category;
//   final VoidCallback deleteCategory;
//   final VoidCallback toggleCategoryStatus;
//   final VoidCallback editCategory; // تمت الإضافة
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       decoration: BoxDecoration(
//         // ... The rest of the decoration is unchanged
//       ),
//       child: InkWell(
//         onTap: () => _showCategoryDetails(context, category),
//         borderRadius: BorderRadius.circular(12),
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   // ... The icon, name, description part is unchanged
//                   Expanded(
//                     // ...
//                   ),
//                   PopupMenuButton<String>(
//                     icon: Icon(Icons.more_vert, color: Colors.grey.shade400),
//                     onSelected: (value) {
//                       if (value == 'view') {
//                         _showCategoryDetails(context, category);
//                       }
//                       if (value == 'edit') {
//                         editCategory(); // استدعاء الدالة الجديدة
//                       }
//                       if (value == 'toggle') {
//                         toggleCategoryStatus();
//                       }
//                       if (value == 'delete') {
//                         deleteCategory();
//                       }
//                     },
//                     itemBuilder: (context) => [
//                       const PopupMenuItem(
//                         value: 'view',
//                         child: Row(children: [
//                           Icon(Icons.visibility, size: 20, color: Colors.blue),
//                           SizedBox(width: 8),
//                           Text('View Details'),
//                         ]),
//                       ),
//                       const PopupMenuItem(
//                         value: 'edit',
//                         child: Row(children: [
//                           Icon(Icons.edit, size: 20, color: Colors.green),
//                           SizedBox(width: 8),
//                           Text('Edit'),
//                         ]),
//                       ),
//                       PopupMenuItem(
//                         value: 'toggle',
//                         child: Row(children: [
//                           Icon(
//                             category.isActive
//                                 ? Icons.pause
//                                 : Icons.play_arrow,
//                             size: 20,
//                             color: category.isActive
//                                 ? Colors.orange
//                                 : Colors.green,
//                           ),
//                           const SizedBox(width: 8),
//                           Text(category.isActive
//                               ? 'Deactivate'
//                               : 'Activate'),
//                         ]),
//                       ),
//                       const PopupMenuItem(
//                         value: 'delete',
//                         child: Row(children: [
//                           Icon(Icons.delete, size: 20, color: Colors.red),
//                           SizedBox(width: 8),
//                           Text('Delete'),
//                         ]),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 'Updated ${_formatDate(category.lastUpdated)}',
//                 style: TextStyle(
//                   color: Colors.grey.shade500,
//                   fontSize: 12,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // The rest of the functions (_getPriorityColor, _formatDate,
//   // _showCategoryDetails, _buildDetailRow) remain unchanged.
//   // Make sure to call editCategory() in the details dialog as well.
//   void _showCategoryDetails(
//       BuildContext context, BeneficiaryCategory category) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         // ... title and content are unchanged
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Close'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               editCategory(); // Call the edit function
//             },
//             child: const Text('Edit'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Other helper methods
//   Color _getPriorityColor(String priority) { /* ... */ return Colors.grey; }
//   String _formatDate(DateTime date) { /* ... */ return ""; }
//   Widget _buildDetailRow(String label, String value) { /* ... */ return Container(); }
// }
