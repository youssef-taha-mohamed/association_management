import 'package:flutter/material.dart';
import 'package:management/feature/family_follow_up/presentation/QuranSchoolsScreen.dart';
import 'package:management/feature/family_follow_up/presentation/FridayMeetingScreen.dart';
import 'package:management/shared/widgets/main_text.dart'; // لو عندك شاشة لقاء الجمعة

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
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Color(0xFF2E7D8A),
        elevation: 0,
        leadingWidth: 180,
        leading: Builder(
          builder: (context) {
            final screenWidth = MediaQuery.of(context).size.width;

            return Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFF2E7D8A),
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back, color: Colors.white, size: 20),
                      if (screenWidth > 360) ...[
                        SizedBox(width: 4),
                        Flexible(
                          child: MainText(
                            'الرجوع للصفحة الرئيسية',

                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,

                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        centerTitle: false,
        title: Align(
          alignment: Alignment.centerRight,
          child: MainText(
            'متابعة الاسرة',

            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
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
            if (item.onTap != null) {
              item.onTap!(context);
            } else {
              _handleTap(item.title, context);
            }
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
        content: MainText('تم النقر على: $title', textAlign: TextAlign.right),
        backgroundColor: Color(0xFF4ECDC4),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
