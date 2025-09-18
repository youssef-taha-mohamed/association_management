import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../shared/widgets/main_text.dart';

class BeneficiaryCategoriesPage extends StatefulWidget {
  const BeneficiaryCategoriesPage({super.key});

  static const routeName = '/beneficiary_categories';

  @override
  State<BeneficiaryCategoriesPage> createState() =>
      _BeneficiaryCategoriesPageState();
}

class _BeneficiaryCategoriesPageState extends State<BeneficiaryCategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: MainText(
          context.l10n.eligible_categories,
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
