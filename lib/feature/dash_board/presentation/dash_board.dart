import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_text.dart';
import '../../distribution/presentation/view/distribution_view.dart';
import '../../drawer/presentation/view/drawer.dart';
import '../../family_follow_up/presentation/family_follow_up.dart';
import '../../setting/presentation/view/setting.dart';
import 'widgets/service_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const String routeName = '/layoutView';

  @override
  Widget build(BuildContext context) {
    final List<ServiceItem> services = [
      ServiceItem(
        title: context.l10n.settings,
        icon: Icons.settings,
        color: Color(0xFF4ECDC4),
        onTap: () {
          Navigator.pushNamed(context, SettingsScreen.routeName);
        },
      ),
      ServiceItem(
        title: context.l10n.distribution,
        icon: Icons.arrow_forward,
        color: Color(0xFF4ECDC4),
        onTap: () {
          Navigator.pushNamed(context, DistributionScreen.routeName);
        },
      ),
      ServiceItem(
        title: 'كشف حالات',
        icon: Icons.description,
        color: Color(0xFF4ECDC4),
      ),
      ServiceItem(
        title: 'بحث ميداني',
        icon: Icons.person_search,
        color: Color(0xFF4ECDC4),
      ),
      ServiceItem(
        title: 'متابعة البرنامج',
        icon: Icons.follow_the_signs,
        color: Color(0xFF90EE90),
      ),
      ServiceItem(
        title: 'المشاريع الصغيرة',
        icon: Icons.star,
        color: Color(0xFFFFD700),
      ),
      ServiceItem(
        title: 'القرض الحسن',
        icon: Icons.account_balance,
        color: Color(0xFFFFD700),
      ),
      ServiceItem(
        title: 'متابعة الاسرة',
        icon: Icons.groups,
        color: Color(0xFFDC3545),
        onTap: () {
          Navigator.pushNamed(context, FamilyFollowUpScreen.routeName);
        },
      ),

    ];
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFF2E7D8A),
        centerTitle: false,
        title: MainText(
          'برنامج إدارة الجمعيات الخيرية',
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      drawer: CustomDrawer(),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 1.0,
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ServiceCard(
              service: services[index],
              onTap: services[index].onTap,
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        color: Color(0xFF2C3E50),
        child: Text(
          'كل الحقوق محفوظة لصالح مركة سوبرنوفا جروب © 2024',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}

class ServiceItem {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  ServiceItem({
    required this.title,
    required this.icon,
    required this.color,
    this.onTap,
  });
}
