import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_text.dart';

import '../../../../../core/style/app_colors.dart';

class UserPermissionsPage extends StatefulWidget {
  static const String routeName = 'user_permissions';

  const UserPermissionsPage({super.key});

  @override
  State<UserPermissionsPage> createState() => _UserPermissionsPageState();
}

class _UserPermissionsPageState extends State<UserPermissionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: MainText(
          context.l10n.user_permissions,
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
      body: Container(),
    );
  }
}
