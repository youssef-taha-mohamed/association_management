import 'package:flutter/material.dart';
import '../../feature/auth/presentation/view/forget_password_email.dart';
import '../../feature/auth/presentation/view/login.dart';
import '../../feature/auth/presentation/view/otp_verification_password.dart';
import '../../feature/auth/presentation/view/register.dart';
import '../../feature/auth/presentation/view/reset_password.dart';
import '../../feature/dash_board/presentation/dash_board.dart';
import '../../feature/distribution/presentation/view/distribution_view.dart';
import '../../feature/family_follow_up/presentation/FridayMeetingScreen.dart';
import '../../feature/family_follow_up/presentation/QuranSchoolsScreen.dart';
import '../../feature/family_follow_up/presentation/family_follow_up.dart';
import '../../feature/fined_research/presentation/widgets/add_case_page.dart';
import '../../feature/fined_research/presentation/widgets/fined_research_view.dart';
import '../../feature/projects/view/projects_screen.dart';
import '../../feature/setting/presentation/cubits/people_data/edit_user_cubit.dart';
import '../../feature/setting/presentation/pages/beneficiaries_dependents/beneficiaries_dep.dart';
import '../../feature/setting/presentation/pages/beneficiary_categories/beneficiary_categories.dart';
import '../../feature/setting/presentation/pages/distributors/distributors.dart';
import '../../feature/setting/presentation/pages/donation_types/donation_types.dart';
import '../../feature/setting/presentation/pages/regions/regions.dart';
import '../../feature/setting/presentation/pages/users/edit_user.dart';
import '../../feature/setting/presentation/pages/users/people_data_view.dart';
import '../../feature/setting/presentation/pages/user_permissions/user_permissions.dart';
import '../../feature/setting/presentation/pages/workplaces/workplaces.dart';
import '../../feature/setting/presentation/view/setting.dart';
import '../../feature/statement/presentation/statement_view.dart';
import '../authentication/provider.dart';

abstract final class AppRouter {
  const AppRouter();

  static String currentRoute = '';

  static Route? generateRoute(RouteSettings routeSettings) {
    final currentUser = AuthenticationProvider.instance.currentUser;
    final routeName = routeSettings.name;
    final argument = routeSettings.arguments;
    debugPrint('routeName: $routeName');
    if (_authenticatedViews.contains(routeName) && currentUser == null) {
      return generateRoute(const RouteSettings(name: LoginView.routeName));
    }
    MaterialPageRoute buildRoute({
      required Widget Function(BuildContext) builder,
    }) {
      return MaterialPageRoute(builder: builder, settings: routeSettings);
    }

    switch (routeName) {
      case LoginView.routeName:
        return buildRoute(builder: (context) => const LoginView());
      case DashboardScreen.routeName:
        return buildRoute(builder: (context) => DashboardScreen());
      case PeopleDataView.routeName:
        return buildRoute(builder: (context) => const PeopleDataView());

      case RegisterView.routeName:
        return buildRoute(
          builder: (context) {
            return const RegisterView();
          },
        );
      case EditUserFullScreen.routeName:
        final arg = argument! as User;
        return buildRoute(
          builder: (context) {
            return EditUserFullScreen(user: arg);
          },
        );

      case StatementScreen.routeName:
        return buildRoute(
          builder: (context) {
            return const StatementScreen();
          },
        );

      case ForgetPasswordEmailView.routeName:
        return buildRoute(
          builder: (context) => const ForgetPasswordEmailView(),
        );
      case DistributionScreen.routeName:
        return buildRoute(builder: (context) => const DistributionScreen(),);
      case FinedResearchView.routeName:
        return buildRoute(builder: (context) => const FinedResearchView());
      case ResetPasswordView.routeName:
        return buildRoute(builder: (context) => const ResetPasswordView(),);
      case AddCasePage.routeName:
        return buildRoute(builder: (context) => const AddCasePage(),);
      case OtpVerificationView.routeName:
        return buildRoute(builder: (context) => OtpVerificationView(),);
      case SettingsScreen.routeName:
        return buildRoute(builder: (context) => SettingsScreen(),);
      case FamilyFollowUpScreen.routeName:
        return buildRoute(builder: (context) => FamilyFollowUpScreen(),);
      case QuranSchoolsScreen.routeName:
        return buildRoute(builder: (context) => QuranSchoolsScreen(),);
      case FridayMeetingScreen.routeName:
        return buildRoute(builder: (context) => FridayMeetingScreen(),);
      case BeneficiariesDepPage.routeName:
        return buildRoute(builder: (context) => BeneficiariesDepPage(),);
        case UserPermissionsPage.routeName:
        return buildRoute(builder: (context) => UserPermissionsPage(),);
        case WorkplacesPage.routeName:
        return buildRoute(builder: (context) => WorkplacesPage(),);
        case BeneficiaryCategoriesPage.routeName:
        return buildRoute(builder: (context) => BeneficiaryCategoriesPage(),);
        case DonationTypesPage.routeName:
        return buildRoute(builder: (context) => DonationTypesPage(),);
        case RegionsPages.routeName:
        return buildRoute(builder: (context) => RegionsPages(),);
        case DistributorsPage.routeName:
        return buildRoute(builder: (context) => DistributorsPage(),);
      case ProjectsScreen.routeName:
        return buildRoute(builder: (context) => ProjectsScreen());
      default:
        throw UnimplementedError();
    }
  }

  static List<String> get _authenticatedViews {
    return <String>[
      // VerifyAccountView.routeName,
      // ChatDreamScreen.routeName,
      // MyTransactionsView.routeName,
      // MyDreamsTabView.routeName,
      // NotificationView.routeName,
      // PaymentInternalMethodsView.routeName,
      // ProfileView.routeName,
      // PaymentMethodsView.routeName,
      // // ContactUsView.routeName,
      // FavouritesView.routeName,
      // CreateDreamView.routeName,
      // MyPackagesView.routeName,
    ];
  }
}
