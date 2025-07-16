import 'package:flutter/material.dart';

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
        padding: EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.1,
          ),
          itemCount: settingItems.length,
          itemBuilder: (context, index) {
            return _buildSettingCard(settingItems[index], context);
          },
        ),
      ),
    );
  }

  Widget _buildSettingCard(SettingItem item, BuildContext context) {
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
            _handleSettingTap(item.title, context);
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

class SettingItem {
  final String title;
  final IconData icon;
  final Color color;

  SettingItem({required this.title, required this.icon, required this.color});
}

// صفحة إضافية لعرض تفاصيل كل إعداد
class SettingDetailScreen extends StatelessWidget {
  final String title;

  SettingDetailScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1976D2),
        title: Text(title, style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction, size: 100, color: Colors.grey),
            SizedBox(height: 20),
            Text(
              'صفحة $title',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'قيد التطوير...',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
