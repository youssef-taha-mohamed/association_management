import 'package:flutter/material.dart';
import 'package:management/shared/widgets/main_text.dart';

class QuranSchoolsScreen extends StatelessWidget {
  static const routeName = '/quran_schools';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2E7D8A),
        elevation: 0,
        leadingWidth: 180,
        leading: Builder(
          builder: (context) {
            final screenWidth = MediaQuery.of(context).size.width;

            return Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFF2E7D8A),
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back, color: Colors.white, size: 20),
                      if (screenWidth > 360) ...[
                        SizedBox(width: 4),
                        Flexible(
                          child: MainText(
                            'الرجوع للصفحة الرئيسية',

                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,

                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        centerTitle: false,
        title: Align(
          alignment: Alignment.centerRight,
          child: MainText(
            'مدارس القران',

            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.settings, color: Colors.white, size: 28),
          ),
        ],
      ),
      body: Center(child: MainText('مدارس القران', fontSize: 20)),
    );
  }
}
