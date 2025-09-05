import 'package:flutter/material.dart';
import 'package:management/feature/family_follow_up/presentation/QuranSchoolsScreen.dart';
import 'package:management/feature/family_follow_up/presentation/FridayMeetingScreen.dart';
import 'package:management/shared/widgets/main_text.dart';

import '../../../core/style/app_colors.dart'; // لو عندك شاشة لقاء الجمعة

class FollowUpItem {
  final String title;
  final IconData icon;
  final Color color;
  final Function(BuildContext context)? onTap;

  FollowUpItem({
    required this.title,
    required this.icon,
    required this.color,
    this.onTap,
  });
}

class FamilyFollowUpScreen extends StatelessWidget {
  static const routeName = '/family_follow_up';

  FamilyFollowUpScreen({super.key});

  final List<FollowUpItem> followUpItems = [
    FollowUpItem(
      title: 'مدارس القران',
      icon: Icons.auto_stories,
      color: Color(0xFF4ECDC4),
      onTap: (context) {
        Navigator.pushNamed(context, QuranSchoolsScreen.routeName);
      },
    ),
    FollowUpItem(
      title: 'لقاء الجمعة',
      icon: Icons.door_sliding_outlined,
      color: Color(0xFF4ECDC4),
      onTap: (context) {
        Navigator.pushNamed(context, FridayMeetingScreen.routeName);
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: MainText(
          'متابعة الاسرة',
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
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.2,
          ),
          itemCount: followUpItems.length,
          itemBuilder: (context, index) {
            return _buildFamFollowUpCard(followUpItems[index], context);
          },
        ),
      ),
    );
  }

  Widget _buildFamFollowUpCard(FollowUpItem item, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
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
            if (item.onTap != null) {
              item.onTap!(context);
            } else {
              _handleTap(item.title, context);
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: item.color,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(item.icon, color: Colors.white, size: 35),
                ),
                SizedBox(height: 16),
                MainText(
                  item.title,
                  textAlign: TextAlign.center,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
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
        content: MainText('تم النقر على: $title', textAlign: TextAlign.right),
        backgroundColor: Color(0xFF4ECDC4),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
