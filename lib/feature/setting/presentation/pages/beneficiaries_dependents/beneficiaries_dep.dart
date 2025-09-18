import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../shared/widgets/main_text.dart';

class BeneficiariesDepPage extends StatefulWidget {
  static const String routeName = 'beneficiaries_dep';

  const BeneficiariesDepPage({super.key});

  @override
  State<BeneficiariesDepPage> createState() => _BeneficiariesDepPageState();
}

class _BeneficiariesDepPageState extends State<BeneficiariesDepPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: MainText(
          context.l10n.data_beneficiaries_dependents,
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
