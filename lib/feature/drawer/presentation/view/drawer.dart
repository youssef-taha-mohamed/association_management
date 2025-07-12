import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management/l10n/l10n.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../shared/widgets/main_text.dart';
import '../../../people_data/presentation/view/people_data_view.dart';
import '../cubit/drawer_cubit.dart';
import 'widgets/drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerCubit(),
      child: Drawer(
        child: Container(
          color: const Color(0xFF2C3E50),
          child: BlocBuilder<DrawerCubit, DrawerState>(
            builder: (context, state) {
              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  // Header
                  DrawerHeader(
                    decoration: const BoxDecoration(color: Color(0xFF2E7D8A)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MainText(
                          context.l10n.home_screen,
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  DrawerExpandedItem(
                    itemKey: 'setting',
                    icon: Icons.settings,
                    title: context.l10n.settings,
                    isExpanded: state.expandedItems['setting'] ?? false,
                    subItems: [
                      SubItemModel(
                        title: context.l10n.user_data,
                        icon: Icons.people,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            PeopleDataView.routeName,
                          );
                        },
                      ),
                      SubItemModel(
                        title: context.l10n.user_permissions,
                        icon: MdiIcons.sword,
                        onTap: () {},
                      ),
                      SubItemModel(
                        title: context.l10n.employee_employers,
                        icon: Icons.person,
                        onTap: () {},
                      ),
                      SubItemModel(
                        title: context.l10n.beneficiary_and_dependent_data,
                        icon: Icons.person,
                        onTap: () {},
                      ),
                      SubItemModel(
                        title: context.l10n.donation_types,
                        icon: Icons.person,
                        onTap: () {},
                      ),
                      SubItemModel(
                        title: context.l10n.beneficiary_categories,
                        icon: Icons.person,
                        onTap: () {},
                      ),
                      SubItemModel(
                        title: context.l10n.region_data,
                        icon: Icons.person,
                        onTap: () {},
                      ),
                    ],
                  ),
                  DrawerExpandedItem(
                    itemKey: 'distribution',
                    icon: Icons.share,
                    title: context.l10n.distribution,
                    isExpanded: state.expandedItems['distribution'] ?? false,
                    subItems: [
                      SubItemModel(
                        title: context.l10n.distribution_data,
                        icon: Icons.person,
                        onTap: () {},
                      ),
                    ],
                  ),
                  DrawerItem(
                    icon: Icons.description,
                    title: context.l10n.case_report,
                    onTap: () {
                      // Navigator.pushNamed(context, SettingsScreen.routeName);
                    },
                  ),
                  DrawerItem(
                    icon: Icons.person_search,
                    title: context.l10n.field_research,
                    onTap: () {
                      // Navigator.pushNamed(context, SettingsScreen.routeName);
                    },
                  ),
                  DrawerExpandedItem(
                    itemKey: 'family_follow',
                    icon: Icons.follow_the_signs,
                    title: context.l10n.family_follow_up,
                    isExpanded: state.expandedItems['family_follow'] ?? false,
                    subItems: [
                      SubItemModel(
                        title: context.l10n.quran_schools,
                        icon: Icons.person,
                        onTap: () {},
                      ),
                      SubItemModel(
                        title: context.l10n.friday_meetings,
                        icon: Icons.person,
                        onTap: () {},
                      ),
                    ],
                  ),
                  DrawerItem(
                    icon: Icons.business,
                    title: context.l10n.micro_projects,
                    onTap: () {
                      // Navigaqtor.pushNamed(context, SettingsScreen.routeName);
                    },
                  ),
                  DrawerItem(
                    icon: Icons.account_balance,
                    title: context.l10n.hassan_loan,
                    onTap: () {
                      // Navigator.pushNamed(context, SettingsScreen.routeName);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class DrawerItemModel {
  final String key;
  final IconData icon;
  final String title;
  final List<String>? subItems;
  final VoidCallback? onTap;

  DrawerItemModel({
    required this.key,
    required this.icon,
    required this.title,
    this.subItems,
    this.onTap,
  });

  bool get isExpandable => subItems != null && subItems!.isNotEmpty;
}
