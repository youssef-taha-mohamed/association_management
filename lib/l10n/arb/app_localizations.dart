import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @konoz.
  ///
  /// In en, this message translates to:
  /// **'Konoz'**
  String get konoz;

  /// No description provided for @see_all.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get see_all;

  /// No description provided for @select_country.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get select_country;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phone_number;

  /// No description provided for @please_enter_your_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get please_enter_your_phone_number;

  /// No description provided for @what_are_you_looking_for.
  ///
  /// In en, this message translates to:
  /// **'What are you looking for ?'**
  String get what_are_you_looking_for;

  /// No description provided for @search_by_name_or_address.
  ///
  /// In en, this message translates to:
  /// **'Search by name or address'**
  String get search_by_name_or_address;

  /// No description provided for @welcome_to_konoz.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Konoz'**
  String get welcome_to_konoz;

  /// No description provided for @holy_quran_education_platform.
  ///
  /// In en, this message translates to:
  /// **'Education Platform'**
  String get holy_quran_education_platform;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get login;

  /// No description provided for @email_userName.
  ///
  /// In en, this message translates to:
  /// **'Username / Email'**
  String get email_userName;

  /// No description provided for @email_validation.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email/username.'**
  String get email_validation;

  /// No description provided for @email_validation_error.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid Email/ Username.'**
  String get email_validation_error;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @password_validation.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get password_validation;

  /// No description provided for @password_validation_size.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters long.'**
  String get password_validation_size;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create new account'**
  String get create_account;

  /// No description provided for @do_not_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account ?'**
  String get do_not_have_account;

  /// No description provided for @forget_password.
  ///
  /// In en, this message translates to:
  /// **'Forget password ?'**
  String get forget_password;

  /// No description provided for @join_to_konoz.
  ///
  /// In en, this message translates to:
  /// **'Join the Konoz community and start your educational journey.'**
  String get join_to_konoz;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get full_name;

  /// No description provided for @data_about_account.
  ///
  /// In en, this message translates to:
  /// **'Account information'**
  String get data_about_account;

  /// No description provided for @full_name_validation.
  ///
  /// In en, this message translates to:
  /// **'Please enter your full name.'**
  String get full_name_validation;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirm_password;

  /// No description provided for @confirm_password_validation.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password.'**
  String get confirm_password_validation;

  /// No description provided for @passwords_do_not_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwords_do_not_match;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @you_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account ?'**
  String get you_have_account;

  /// No description provided for @terms.
  ///
  /// In en, this message translates to:
  /// **'I agree to the Terms of Use and Privacy Policy'**
  String get terms;

  /// No description provided for @terms_validation.
  ///
  /// In en, this message translates to:
  /// **'Please accept the terms and conditions.'**
  String get terms_validation;

  /// No description provided for @email_va.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address.'**
  String get email_va;

  /// No description provided for @email_err.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get email_err;

  /// No description provided for @guest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get guest;

  /// No description provided for @user_name.
  ///
  /// In en, this message translates to:
  /// **'User Name'**
  String get user_name;

  /// No description provided for @user_name_validation.
  ///
  /// In en, this message translates to:
  /// **'Please enter your user name'**
  String get user_name_validation;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @enter_your_email_to_reset_your_password.
  ///
  /// In en, this message translates to:
  /// **'Enter your email to recover your password'**
  String get enter_your_email_to_reset_your_password;

  /// No description provided for @recover_password.
  ///
  /// In en, this message translates to:
  /// **'Recover your password'**
  String get recover_password;

  /// No description provided for @send_code.
  ///
  /// In en, this message translates to:
  /// **'Send code'**
  String get send_code;

  /// No description provided for @otp_verification.
  ///
  /// In en, this message translates to:
  /// **'OTP Verification'**
  String get otp_verification;

  /// No description provided for @otp_verification_description.
  ///
  /// In en, this message translates to:
  /// **'A verification code has been sent to your email.'**
  String get otp_verification_description;

  /// No description provided for @enter_otp.
  ///
  /// In en, this message translates to:
  /// **'Enter verification code'**
  String get enter_otp;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @resend_code.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get resend_code;

  /// No description provided for @change_password.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get change_password;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get new_password;

  /// No description provided for @change_password_desc.
  ///
  /// In en, this message translates to:
  /// **'Create a new password for your account'**
  String get change_password_desc;

  /// No description provided for @save_password.
  ///
  /// In en, this message translates to:
  /// **'Save password'**
  String get save_password;

  /// No description provided for @please_enter_complete_code.
  ///
  /// In en, this message translates to:
  /// **'Please enter complete code'**
  String get please_enter_complete_code;

  /// No description provided for @code_sent_successfully.
  ///
  /// In en, this message translates to:
  /// **'Code sent successfully'**
  String get code_sent_successfully;

  /// No description provided for @exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @are_you_sure_you_want_exit.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to exit this page ?'**
  String get are_you_sure_you_want_exit;

  /// No description provided for @stay.
  ///
  /// In en, this message translates to:
  /// **'Stay'**
  String get stay;

  /// No description provided for @activation_status.
  ///
  /// In en, this message translates to:
  /// **'Activation Status'**
  String get activation_status;

  /// No description provided for @add_new_project.
  ///
  /// In en, this message translates to:
  /// **'Add New Project'**
  String get add_new_project;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @application.
  ///
  /// In en, this message translates to:
  /// **'Application'**
  String get application;

  /// No description provided for @bag_content_type.
  ///
  /// In en, this message translates to:
  /// **'Bag Content Type'**
  String get bag_content_type;

  /// No description provided for @bag_value_egp.
  ///
  /// In en, this message translates to:
  /// **'Bag Value in Egyptian Pounds'**
  String get bag_value_egp;

  /// No description provided for @beneficiary_and_dependent_data.
  ///
  /// In en, this message translates to:
  /// **'Beneficiary and Dependent Data'**
  String get beneficiary_and_dependent_data;

  /// No description provided for @beneficiary_categories.
  ///
  /// In en, this message translates to:
  /// **'Beneficiary Categories'**
  String get beneficiary_categories;

  /// No description provided for @beneficiary_name.
  ///
  /// In en, this message translates to:
  /// **'Beneficiary Name'**
  String get beneficiary_name;

  /// No description provided for @case_report.
  ///
  /// In en, this message translates to:
  /// **'Case Report'**
  String get case_report;

  /// No description provided for @charity_management_program.
  ///
  /// In en, this message translates to:
  /// **'Charity Management Program'**
  String get charity_management_program;

  /// No description provided for @distribution.
  ///
  /// In en, this message translates to:
  /// **'Distribution'**
  String get distribution;

  /// No description provided for @distribution_data.
  ///
  /// In en, this message translates to:
  /// **'Distribution Data'**
  String get distribution_data;

  /// No description provided for @distribution_list_contents.
  ///
  /// In en, this message translates to:
  /// **'Distribution List Contents'**
  String get distribution_list_contents;

  /// No description provided for @distributor_data.
  ///
  /// In en, this message translates to:
  /// **'Distributor Data'**
  String get distributor_data;

  /// No description provided for @donation_types.
  ///
  /// In en, this message translates to:
  /// **'Donation Types'**
  String get donation_types;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @employee_employers.
  ///
  /// In en, this message translates to:
  /// **'Employee Employers'**
  String get employee_employers;

  /// No description provided for @family_follow_up.
  ///
  /// In en, this message translates to:
  /// **'Family Follow-up'**
  String get family_follow_up;

  /// No description provided for @field_research.
  ///
  /// In en, this message translates to:
  /// **'Field Research'**
  String get field_research;

  /// No description provided for @friday_meetings.
  ///
  /// In en, this message translates to:
  /// **'Friday Meetings'**
  String get friday_meetings;

  /// No description provided for @governorate.
  ///
  /// In en, this message translates to:
  /// **'Governorate'**
  String get governorate;

  /// No description provided for @has_project.
  ///
  /// In en, this message translates to:
  /// **'Has a Project'**
  String get has_project;

  /// No description provided for @hassan_loan.
  ///
  /// In en, this message translates to:
  /// **'Hassan Loan'**
  String get hassan_loan;

  /// No description provided for @net_income.
  ///
  /// In en, this message translates to:
  /// **'Net Income'**
  String get net_income;

  /// No description provided for @no_data_according_to_search_indicators.
  ///
  /// In en, this message translates to:
  /// **'No Data According to Search Indicators'**
  String get no_data_according_to_search_indicators;

  /// No description provided for @number.
  ///
  /// In en, this message translates to:
  /// **'Number'**
  String get number;

  /// No description provided for @primary_category.
  ///
  /// In en, this message translates to:
  /// **'Primary Category'**
  String get primary_category;

  /// No description provided for @procedures.
  ///
  /// In en, this message translates to:
  /// **'Procedures'**
  String get procedures;

  /// No description provided for @project_income.
  ///
  /// In en, this message translates to:
  /// **'Project Income'**
  String get project_income;

  /// No description provided for @project_name.
  ///
  /// In en, this message translates to:
  /// **'Project Name'**
  String get project_name;

  /// No description provided for @quran_schools.
  ///
  /// In en, this message translates to:
  /// **'Quran Schools'**
  String get quran_schools;

  /// No description provided for @region.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get region;

  /// No description provided for @region_data.
  ///
  /// In en, this message translates to:
  /// **'Region Data'**
  String get region_data;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @search_indicators.
  ///
  /// In en, this message translates to:
  /// **'Search Indicators'**
  String get search_indicators;

  /// No description provided for @select_region.
  ///
  /// In en, this message translates to:
  /// **'Select Region'**
  String get select_region;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @small_projects.
  ///
  /// In en, this message translates to:
  /// **'Small Projects'**
  String get small_projects;

  /// No description provided for @user_data.
  ///
  /// In en, this message translates to:
  /// **'User Data'**
  String get user_data;

  /// No description provided for @user_permissions.
  ///
  /// In en, this message translates to:
  /// **'User Permissions'**
  String get user_permissions;

  /// No description provided for @value_of_donations_egp.
  ///
  /// In en, this message translates to:
  /// **'Donation Value in Egyptian Pounds'**
  String get value_of_donations_egp;

  /// No description provided for @quantity_kg.
  ///
  /// In en, this message translates to:
  /// **'Quantity in Kilograms'**
  String get quantity_kg;

  /// No description provided for @home_screen.
  ///
  /// In en, this message translates to:
  /// **'Home Screen'**
  String get home_screen;

  /// No description provided for @micro_projects.
  ///
  /// In en, this message translates to:
  /// **'Micro Projects'**
  String get micro_projects;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
