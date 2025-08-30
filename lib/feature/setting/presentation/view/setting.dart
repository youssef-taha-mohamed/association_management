import 'package:flutter/material.dart';
import 'package:management/shared/widgets/main_text.dart';
import 'widgets/setting_item.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';
  final List<SettingItem> settingItems = [
    SettingItem(
      title: 'بيانات المستخدمين',
      icon: Icons.person,
      color: Color(0xFF4ECDC4),
    ),
    SettingItem(
      title: 'صلاحيات المستخدمين',
      icon: Icons.person_add,
      color: Color(0xFF4ECDC4),
    ),
    SettingItem(
      title: 'جهات عمل الموظفين',
      icon: Icons.business,
      color: Color(0xFF4ECDC4),
    ),
    SettingItem(
      title: 'بيانات المستحقين والمعالين',
      icon: Icons.people,
      color: Color(0xFF4ECDC4),
    ),
    SettingItem(
      title: 'انواع التبرعات',
      icon: Icons.volunteer_activism,
      color: Color(0xFF90EE90),
    ),
    SettingItem(
      title: 'فئات المستحقين',
      icon: Icons.category,
      color: Color(0xFFFFE082),
    ),
    SettingItem(
      title: 'بيانات الموزعين',
      icon: Icons.delivery_dining,
      color: Color(0xFFFFD54F),
    ),
    SettingItem(
      title: 'بيانات المناطق',
      icon: Icons.location_on,
      color: Color(0xFFFF8A65),
    ),
  ];

  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1976D2),
        elevation: 0,
        title: Text(
          'الإعدادات',
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
        padding: EdgeInsets.only(left: 12,right: 12,top: 12,bottom: 12),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount: settingItems.length,
          itemBuilder: (context, index) {
            return SettingCard(item: settingItems[index],
            );
          },
        ),
      ),
    );
  }

  void _handleSettingTap(String title, BuildContext context) {
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
