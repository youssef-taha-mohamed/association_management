import 'package:flutter/material.dart';
import 'package:management/shared/widgets/main_text.dart';
import '../../../../core/style/app_colors.dart';
import '../pages/beneficiaries_dependents/beneficiaries_dep.dart';
import '../pages/beneficiary_categories/beneficiary_categories.dart';
import '../pages/distributors/distributors.dart';
import '../pages/donation_types/donation_types.dart';
import '../pages/regions/regions.dart';
import '../pages/user_permissions/user_permissions.dart';
import '../pages/users/people_data_view.dart';
import '../pages/workplaces/workplaces.dart';
import 'widgets/setting_item.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SettingItem> settingItems = [
      SettingItem(
        title: 'بيانات المستخدمين',
        icon: Icons.person,
        color: Color(0xFF4ECDC4),
        onTap: () {
          Navigator.pushNamed(context, PeopleDataView.routeName);
        },
      ),
      SettingItem(
        title: 'صلاحيات المستخدمين',
        icon: Icons.person_add,
        color: Color(0xFF4ECDC4),
        onTap: () {
          Navigator.pushNamed(context, UserPermissionsPage.routeName);
        },
      ),
      SettingItem(
        title: 'جهات عمل الموظفين',
        icon: Icons.business,
        color: Color(0xFF4ECDC4),
        onTap: () {
          Navigator.pushNamed(context, WorkplacesPage.routeName);
        },
      ),
      SettingItem(
        title: 'بيانات المستحقين والمعالين',
        icon: Icons.people,
        color: Color(0xFF4ECDC4),
        onTap: () {
          Navigator.pushNamed(context, BeneficiariesDepPage.routeName);
        },
      ),
      SettingItem(
        title: 'انواع التبرعات',
        icon: Icons.volunteer_activism,
        color: Color(0xFF90EE90),
        onTap: () {
          Navigator.pushNamed(context, DonationTypesPage.routeName);
        },
      ),
      SettingItem(
        title: 'فئات المستحقين',
        icon: Icons.category,
        color: Color(0xFFFFE082),
        onTap: () {
          Navigator.pushNamed(context, BeneficiaryCategoriesPage.routeName);
        },
      ),
      SettingItem(
        title: 'بيانات الموزعين',
        icon: Icons.delivery_dining,
        color: Color(0xFFFFD54F),
        onTap: () {
          Navigator.pushNamed(context, DistributorsPage.routeName);
        },
      ),
      SettingItem(
        title: 'بيانات المناطق',
        icon: Icons.location_on,
        color: Color(0xFFFF8A65),
        onTap: () {
          Navigator.pushNamed(context, RegionsPages.routeName);
        },
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: MainText(
          'الإعدادات',
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
        padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount: settingItems.length,
          itemBuilder: (context, index) {
            return SettingCard(item: settingItems[index]);
          },
        ),
      ),
    );
  }
}
