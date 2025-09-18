import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';

import '../../../../../core/style/app_colors.dart';
import '../../../../../shared/widgets/main_text.dart';

class RegionsPages extends StatefulWidget {
  const RegionsPages({super.key});
  static const routeName = '/regions';

  @override
  State<RegionsPages> createState() => _RegionsPagesState();
}

class _RegionsPagesState extends State<RegionsPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: MainText(
          context.l10n.data_places,
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
