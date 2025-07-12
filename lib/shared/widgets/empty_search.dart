import 'package:flutter/material.dart';
import '../../core/extension/extension_helper.dart';
import '../../core/resources/images.dart';
import '../../l10n/l10n.dart';
import 'main_text.dart';

class EmptySearchScreen extends StatelessWidget {
  const EmptySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          70.ph,
          Image.asset(
            ImagesAssets.search,
            width: 200,
            height: 200,
          ),
          20.ph,
          MainText(
            context.l10n.what_are_you_looking_for,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          20.ph,
          MainText(
            context.l10n.search_by_name_or_address,
            fontSize: 18,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
