import 'package:flutter/material.dart';
import 'package:management/core/style/app_colors.dart';
import 'package:management/shared/widgets/main_text.dart';

class FridayMeetingScreen extends StatelessWidget {
  static const routeName = '/friday_meeting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: MainText(
          'لقاء الجمعة',
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
      body: Center(child: MainText(' لقاء الجمعة', fontSize: 20)),
    );
  }
}
