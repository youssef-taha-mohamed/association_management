import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_text.dart';
import '../../../../core/style/app_colors.dart';
import '../../../people_data/presentation/view/people_data_view.dart';
import 'widgets/setting_item.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SettingItem> settingItems = [
      SettingItem(
        title: context.l10n.user_data,
        icon: Icons.person,
        color: AppColors.appGreenG2,
        onTap: () {
          Navigator.pushNamed(context, PeopleDataView.routeName);
        },
      ),
      SettingItem(
        title: context.l10n.user_permissions,
        icon: Icons.person_add,
        color: AppColors.appGreenG2,
        onTap: () {},
      ),
      SettingItem(
        title: context.l10n.employers,
        icon: Icons.business,
        color: AppColors.appGreenG2,
        onTap: () {},
      ),
      SettingItem(
        title: context.l10n.data_beneficiaries_dependents,
        icon: Icons.people,
        color: AppColors.appGreenG2,
        onTap: () {},
      ),
      SettingItem(
        title: context.l10n.types_donations,
        icon: Icons.volunteer_activism,
        color: AppColors.green1,
        onTap: () {},
      ),
      SettingItem(
        title: context.l10n.eligible_categories,
        icon: Icons.category,
        color: AppColors.yellowG1,
        onTap: () {},
      ),
      SettingItem(
        title: context.l10n.distributor_data,
        icon: Icons.delivery_dining,
        color: AppColors.yellowG2,
        onTap: () {},
      ),
      SettingItem(
        title: context.l10n.data_places,
        icon: Icons.location_on,
        color: AppColors.orangeG1,
        onTap: () {},
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: MainText(
          context.l10n.settings,
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
