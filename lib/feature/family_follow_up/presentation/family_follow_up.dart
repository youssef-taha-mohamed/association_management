import 'package:flutter/material.dart';

import '../../setting/presentation/view/setting.dart';

class FamilyFollowUpScreen extends StatelessWidget {
static const routeName = '/family_follow_up';
final List<SettingItem> FollowUpItems = [
  SettingItem(
    title: 'مدارس القران',
    icon: Icons.auto_stories,
    color: Color(0xFF4ECDC4),
  ),
  SettingItem(
    title: 'لقاء الجمعة',
    icon: Icons.door_sliding_outlined,
    color: Color(0xFF4ECDC4),
  ),

];

   FamilyFollowUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Color(0xFF1976D2),
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFF1976D2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_back, color: Colors.white, size: 16),
                SizedBox(width: 4),
                Text(
                  'الرجوع للصفحة الرئيسية',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'متابعة الاسرة',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.settings, color: Colors.white, size: 28),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.1,
          ),
          itemCount: FollowUpItems.length,
          itemBuilder: (context, index) {
            return _buildFamFollowUpCard(FollowUpItems[index], context);
          },
        ),
      ),


    );
  }
Widget _buildFamFollowUpCard(SettingItem item, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          spreadRadius: 0,
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          _handleTap(item.title, context);
        },
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: item.color,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: item.color.withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(item.icon, color: Colors.white, size: 35),
              ),
              SizedBox(height: 16),
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C3E50),
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

void _handleTap(String title, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('تم النقر على: $title', textAlign: TextAlign.right),
      backgroundColor: Color(0xFF4ECDC4),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
}



