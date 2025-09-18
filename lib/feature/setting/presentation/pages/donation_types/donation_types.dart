import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../shared/widgets/main_text.dart';

class DonationTypesPage extends StatefulWidget {
  const DonationTypesPage({super.key});

  static const routeName = '/donation_types';

  @override
  State<DonationTypesPage> createState() => _DonationTypesPageState();
}

class _DonationTypesPageState extends State<DonationTypesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: MainText(
          context.l10n.donation_types,
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
