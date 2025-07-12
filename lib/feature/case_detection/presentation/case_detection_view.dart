import 'package:flutter/material.dart';
import 'package:management/shared/widgets/main_text.dart';

class CaseDetection extends StatefulWidget {
  const CaseDetection({super.key});
  static const routeName = "/case_detection";

  @override
  State<CaseDetection> createState() => _CaseDetectionState();
}

class _CaseDetectionState extends State<CaseDetection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: MainText('CaseDetection')));
  }
}
