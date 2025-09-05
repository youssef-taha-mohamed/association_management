import 'package:flutter/material.dart';
import 'package:management/feature/auth/presentation/view/login.dart';
import '../../core/resources/images.dart';
import '../../core/style/app_colors.dart';
import '../../feature/dash_board/presentation/dash_board.dart';
import '../view_model/splash_view_model.dart';
import '../view_model/state.dart';
import '../widgets/jumping_dots_progress_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _viewModel = const SplashScreenViewModel();

  @override
  void initState() {
    _init(context);
    super.initState();
  }

  Future<void> _init(BuildContext context) async {
    final state = await _viewModel.init();

    if (!context.mounted) {
      return;
    }
    debugPrint('state: $state');
    switch (state) {
      case SplashState.notOpenedAppBefore:
      case SplashState.notLoggedIn:
        await Navigator.pushNamedAndRemoveUntil(
          context,
          LoginView.routeName,
          (route) => false,
        );
      case SplashState.loggedIn:
        // FlutterAppBadge.count(0);

        await Navigator.pushNamedAndRemoveUntil(
          context,
          DashboardScreen.routeName,
          (route) => false,
        );

      case SplashState.complete:
      // await Navigator.pushNamedAndRemoveUntil(
      //   context,
      //   CompleteView.routeName,
      //       (route) => false,
      // );
      case SplashState.phoneNotVerified:
      // await Navigator.pushNamedAndRemoveUntil(
      //   context,
      //   VerifyAccountView.routeName,
      //       (route) => false,
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Image.asset(ImagesAssets.logo, width: 180, height: 90),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: const JumpingDotsProgressIndicator(
                color: AppColors.goldAccent,
                dotSpacing: 2,
                milliseconds: 100,
                numberOfDots: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
