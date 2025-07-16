import 'package:flutter/material.dart';
import '../../feature/auth/presentation/view/forget_password_email.dart';
import '../../feature/auth/presentation/view/login.dart';
import '../../feature/auth/presentation/view/otp_verification_password.dart';
import '../../feature/auth/presentation/view/register.dart';
import '../../feature/auth/presentation/view/reset_password.dart';
import '../../feature/dash_board/presentation/dash_board.dart';
import '../../feature/distribution/presentation/view/distribution_view.dart';
import '../../feature/family_follow_up/presentation/family_follow_up.dart';
import '../../feature/parent/home/presentation/home_parents.dart';
import '../../feature/people_data/presentation/cubit/edit_user_cubit.dart';
import '../../feature/people_data/presentation/view/edit_user.dart';
import '../../feature/people_data/presentation/view/people_data_view.dart';
import '../../feature/setting/presentation/view/setting.dart';
import '../authentication/provider.dart';

abstract final class AppRouter {
  const AppRouter();

  static String currentRoute = '';

  static Route? generateRoute(RouteSettings routeSettings) {
    final currentUser = AuthenticationProvider.instance.currentUser;
    final routeName = routeSettings.name;
    final argument = routeSettings.arguments;
    print('routeName: $routeName');
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
      // region parents routed
      case HomeParentsView.routeName:
        return buildRoute(builder: (context) => const HomeParentsView());
      case PeopleDataView.routeName:
        return buildRoute(builder: (context) => const PeopleDataView());
      // case DreamDetails.routeName:
      //   if (argument is DreamDetailsArguments) {
      //     final arg = argument;
      //
      //     return _buildRoute(
      //       builder: (context) => DreamDetails(arguments: arg),
      //     );
      //   } else if (argument is Dream) {
      //     final arg = argument;
      //     return _buildRoute(
      //       builder: (context) => DreamDetails(
      //         arguments: DreamDetailsArguments(dreamId: arg.id),
      //       ),
      //     );
      //   } else {
      //     assert(false, 'The argument must be of type DreamDetailsArguments.');
      //
      //     return null;
      //   }
      //
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
      // case HomeView.routeName:
      //   return _buildRoute(builder: (context) {
      //     var map = argument as Map<String, dynamic>?;
      //     return BlocProvider(
      //       create: (context) => HomeCubit(),
      //       child: HomeView(
      //         index: map?['index'] as int?,
      //         secondIndex: map?['index2'] as int?,
      //       ),
      //     );
      //   });
      // case CompleteView.routeName:
      //   return _buildRoute(builder: (context) {
      //     return BlocProvider(
      //       create: (context) => RegisterCubit(),
      //       child: const CompleteView(),
      //     );
      //   });
      // case BlogsView.routeName:
      //   assert(
      //   argument is BlogsViewArguments,
      //   'The argument must be of type BlogsViewArguments.',
      //   );
      //   final arg = argument! as BlogsViewArguments;
      //   return _buildRoute(
      //     builder: (context) => BlogsView(arguments: arg),
      //   );
      case ForgetPasswordEmailView.routeName:
        return buildRoute(
          builder: (context) => const ForgetPasswordEmailView(),
        );
      case DistributionScreen.routeName:
        return buildRoute(builder: (context) => const DistributionScreen(),);
      case ResetPasswordView.routeName:
        return buildRoute(builder: (context) => const ResetPasswordView(),);
      case OtpVerificationView.routeName:
        // final arg = argument as Blog?;
        return buildRoute(builder: (context) => OtpVerificationView(),);
      case SettingsScreen.routeName:
        return buildRoute(builder: (context) => SettingsScreen(),);
      case FamilyFollowUpScreen.routeName:
        return buildRoute(builder: (context) => FamilyFollowUpScreen(),);



    // case MyTransactionsView.routeName:
      //   return _buildRoute(
      //     builder: (context) => const MyTransactionsView(),
      //   );
      // case UnauthenticatedView.routeName:
      //   return _buildRoute(
      //     builder: (context) => const UnauthenticatedView(),
      //   );
      // case SettingView.routeName:
      //   return _buildRoute(
      //     builder: (context) => const SettingView(),
      //   );
      // case ChangePassword.routeName:
      //   return _buildRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => SettingCubit(
      //         repository: DependencyInjector.userRepository,
      //       ),
      //       child: const ChangePassword(),
      //     ),
      //   );
      // case MyDreamsTabView.routeName:
      //   return _buildRoute(
      //     builder: (context) => const MyDreamsTabView(),
      //   );
      // case PackagesView.routeName:
      //   return _buildRoute(
      //     builder: (context) => PackagesView(
      //       selectedPackageId: argument as int?,
      //     ),
      //   );
      // case SupportView.routeName:
      //   return _buildRoute(
      //     builder: (context) => const SupportView(),
      //   );
      // case NotificationView.routeName:
      //   return _buildRoute(
      //     builder: (context) => const NotificationView(),
      //   );
      // case PrivacyView.routeName:
      //   return _buildRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => PagesCubit(
      //         repo: DependencyInjector.pagesRepository,
      //       ),
      //       child: const PrivacyView(),
      //     ),
      //   );
      // case DreamInterpretersView.routeName:
      //   return _buildRoute(
      //     builder: (context) => const DreamInterpretersView(),
      //   );
      // case CreateDreamView.routeName:
      //   return _buildRoute(
      //     builder: (context) => CreateDreamView(
      //       dream: argument is Dream ? argument : null,
      //       expert: argument is DreamInterpreter ? argument : null,
      //     ),
      //   );
      //
      // case ExpertProfileView.routeName:
      //   assert(
      //   argument is DreamInterpreterProfileArguments,
      //   'The argument must be of type DreamInterpreterProfileArguments.',
      //   );
      //
      //   final arg = argument! as DreamInterpreterProfileArguments;
      //   return _buildRoute(
      //     builder: (context) => ExpertProfileView(arguments: arg),
      //   );
      // case PaymentInternalMethodsView.routeName:
      //   assert(
      //   argument is PaymentInternalMethodViewArguments,
      //   'The argument must be of type PaymentInternalMethodViewArguments.',
      //   );
      //   final arg = argument! as PaymentInternalMethodViewArguments;
      //   return _buildRoute(
      //     builder: (context) => PaymentInternalMethodsView(arguments: arg),
      //   );
      // case BlogDetails.routeName:
      //   assert(
      //   argument is BlogDetailsViewArguments,
      //   'The argument must be of type BlogDetailsViewArguments.',
      //   );
      //
      //   final arg = argument! as BlogDetailsViewArguments;
      //   return _buildRoute(
      //     builder: (context) => BlogDetails(arguments: arg),
      //   );
      // case SelectDreamTypesView.routeName:
      //   assert(
      //   argument is DreamTypeViewArguments,
      //   'The argument must be of type DreamTypeViewArguments.',
      //   );
      //
      //   final arg = argument! as DreamTypeViewArguments;
      //   return _buildRoute(
      //     builder: (context) => SelectDreamTypesView(arguments: arg),
      //   );
      // case ProfileView.routeName:
      //   return _buildRoute(
      //     builder: (context) => const ProfileView(),
      //   );
      // case PaymentMethodsView.routeName:
      //   final arg = argument! as double?;
      //   return _buildRoute(
      //     builder: (context) =>  PaymentMethodsView(
      //       amount: arg ?? 0.0,
      //     ),
      //   );
      // case ContactUsView.routeName:
      //   return _buildRoute(
      //     builder: (context) {
      //       return BlocProvider(
      //         create: (context) => ContactCubit(
      //           repository: DependencyInjector.contactUsRepository,
      //         ),
      //         child: const ContactUsView(),
      //       );
      //     },
      //   );
      // case FavouritesView.routeName:
      //   return _buildRoute(
      //     builder: (context) => const FavouritesView(),
      //   );
      // case StepFour.routeName:
      //   return _buildRoute(
      //     builder: (context) => const StepFour(),
      //   );
      // case RepliesScreen.routeName:
      //   assert(
      //   argument is RepliesBlogViewArguments,
      //   'The argument must be of type RepliesBlogViewArguments.',
      //   );
      //
      //   final arg = argument! as RepliesBlogViewArguments;
      //
      //   return _buildRoute(
      //     builder: (context) => RepliesScreen(arguments: arg),
      //   );
      //
      // case BlogDreamDetails.routeName:
      //   assert(
      //   argument is BlogCommentDreamDetailsViewArguments,
      //   'The argument must be of type BlogCommentDreamDetailsViewArguments.',
      //   );
      //   final arg = argument! as BlogCommentDreamDetailsViewArguments;
      //   return _buildRoute(
      //     builder: (context) => BlogDreamDetails(arguments: arg),
      //   );
      // case CircularSelectDreamInterpreterView.routeName:
      //   assert(
      //   argument is CircularSelectInterpreterViewArguments,
      //   'The argument must be of type CircularSelectInterpreterViewArguments',
      //   );
      //   final arg = argument! as CircularSelectInterpreterViewArguments;
      //   return _buildRoute(
      //     builder: (context) => CircularSelectDreamInterpreterView(
      //       arguments: arg,
      //     ),
      //   );
      // case UnauthorizedView.routeName:
      //   return _buildRoute(
      //     builder: (context) => const UnauthorizedView(),
      //   );
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
