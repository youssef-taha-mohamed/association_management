import 'package:flutter/material.dart';
class WelcomeView extends StatefulWidget {
  static const String routeName = '/welcome';
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome'),
      ),
    );
  }
}
