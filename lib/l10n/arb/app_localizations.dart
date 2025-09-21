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

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Charity Management Application'**
  String get welcome;

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
  /// **'Username'**
  String get email_userName;

  /// No description provided for @email_validation.
  ///
  /// In en, this message translates to:
  /// **'Please enter your username.'**
  String get email_validation;

  /// No description provided for @email_validation_error.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid Username.'**
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

  /// No description provided for @the_area.
  ///
  /// In en, this message translates to:
  /// **'The area'**
  String get the_area;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @donations.
  ///
  /// In en, this message translates to:
  /// **'Donations'**
  String get donations;

  /// No description provided for @the_condition.
  ///
  /// In en, this message translates to:
  /// **'The condition'**
  String get the_condition;

  /// No description provided for @does_he_have_a_project.
  ///
  /// In en, this message translates to:
  /// **'Does he have a project?'**
  String get does_he_have_a_project;

  /// No description provided for @is_activated.
  ///
  /// In en, this message translates to:
  /// **'Is it activated?'**
  String get is_activated;

  /// No description provided for @add_new.
  ///
  /// In en, this message translates to:
  /// **'Add a new case'**
  String get add_new;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'save'**
  String get save;

  /// No description provided for @name_required.
  ///
  /// In en, this message translates to:
  /// **'Field Name is required'**
  String get name_required;

  /// No description provided for @age_required.
  ///
  /// In en, this message translates to:
  /// **'Field Age is required'**
  String get age_required;

  /// No description provided for @phone_number_required.
  ///
  /// In en, this message translates to:
  /// **'Field Phone number is required'**
  String get phone_number_required;

  /// No description provided for @address_required.
  ///
  /// In en, this message translates to:
  /// **'Field Address is required'**
  String get address_required;

  /// No description provided for @the_area_required.
  ///
  /// In en, this message translates to:
  /// **'Field The area is required'**
  String get the_area_required;

  /// No description provided for @net_income_required.
  ///
  /// In en, this message translates to:
  /// **'Field Net income is required'**
  String get net_income_required;

  /// No description provided for @category_required.
  ///
  /// In en, this message translates to:
  /// **'Field Category is required'**
  String get category_required;

  /// No description provided for @donations_required.
  ///
  /// In en, this message translates to:
  /// **'Field Donations is required'**
  String get donations_required;

  /// No description provided for @the_condition_required.
  ///
  /// In en, this message translates to:
  /// **'Field The Condition is required'**
  String get the_condition_required;

  /// No description provided for @governorate_required.
  ///
  /// In en, this message translates to:
  /// **'Field the Governorate is required'**
  String get governorate_required;

  /// No description provided for @number_criteria_required.
  ///
  /// In en, this message translates to:
  /// **'Field the Number Criteria is required'**
  String get number_criteria_required;

  /// No description provided for @number_of_criteria.
  ///
  /// In en, this message translates to:
  /// **'Number of criteria'**
  String get number_of_criteria;

  /// No description provided for @password_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get password_required;

  /// No description provided for @type_of_validity.
  ///
  /// In en, this message translates to:
  /// **'Type of validity'**
  String get type_of_validity;

  /// No description provided for @enter_the_project_name.
  ///
  /// In en, this message translates to:
  /// **'Enter the project name'**
  String get enter_the_project_name;

  /// No description provided for @income_value_income.
  ///
  /// In en, this message translates to:
  /// **'income value income'**
  String get income_value_income;

  /// No description provided for @cancellation.
  ///
  /// In en, this message translates to:
  /// **'cancellation'**
  String get cancellation;

  /// No description provided for @there_are_no_projects.
  ///
  /// In en, this message translates to:
  /// **'There are no projects yet, click + to add.'**
  String get there_are_no_projects;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @activation.
  ///
  /// In en, this message translates to:
  /// **'activation'**
  String get activation;

  /// No description provided for @complete_the_data.
  ///
  /// In en, this message translates to:
  /// **'Complete the data'**
  String get complete_the_data;

  /// No description provided for @he_has_a_project.
  ///
  /// In en, this message translates to:
  /// **'He has a project'**
  String get he_has_a_project;

  /// No description provided for @he_has_no_project.
  ///
  /// In en, this message translates to:
  /// **'He has no project'**
  String get he_has_no_project;

  /// No description provided for @case_detection.
  ///
  /// In en, this message translates to:
  /// **'Case detection'**
  String get case_detection;

  /// No description provided for @project_schedule.
  ///
  /// In en, this message translates to:
  /// **'Project schedule'**
  String get project_schedule;

  /// No description provided for @beneficiary_data.
  ///
  /// In en, this message translates to:
  /// **'Beneficiary data'**
  String get beneficiary_data;

  /// No description provided for @data_beneficiaries_dependents.
  ///
  /// In en, this message translates to:
  /// **'Data of beneficiaries and dependents'**
  String get data_beneficiaries_dependents;

  /// No description provided for @data_places.
  ///
  /// In en, this message translates to:
  /// **'Data places'**
  String get data_places;

  /// No description provided for @eligible_categories.
  ///
  /// In en, this message translates to:
  /// **'Eligible categories'**
  String get eligible_categories;

  /// No description provided for @employers.
  ///
  /// In en, this message translates to:
  /// **'employers'**
  String get employers;

  /// No description provided for @types_donations.
  ///
  /// In en, this message translates to:
  /// **'Types Donations'**
  String get types_donations;

  /// No description provided for @add_user.
  ///
  /// In en, this message translates to:
  /// **'Add User'**
  String get add_user;

  /// No description provided for @under_development.
  ///
  /// In en, this message translates to:
  /// **'Under development...'**
  String get under_development;

  /// No description provided for @page.
  ///
  /// In en, this message translates to:
  /// **'page'**
  String get page;

  /// No description provided for @families_in_need.
  ///
  /// In en, this message translates to:
  /// **'Families in Need'**
  String get families_in_need;

  /// No description provided for @no_beneficiaries_found.
  ///
  /// In en, this message translates to:
  /// **'No beneficiaries found'**
  String get no_beneficiaries_found;

  /// No description provided for @try_adjusting_search_filters.
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your search or filters'**
  String get try_adjusting_search_filters;

  /// No description provided for @filter_beneficiaries.
  ///
  /// In en, this message translates to:
  /// **'Filter Beneficiaries'**
  String get filter_beneficiaries;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @add_beneficiary.
  ///
  /// In en, this message translates to:
  /// **'Add Beneficiary'**
  String get add_beneficiary;

  /// No description provided for @personal_information.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personal_information;

  /// No description provided for @please_enter_full_name.
  ///
  /// In en, this message translates to:
  /// **'Please enter full name'**
  String get please_enter_full_name;

  /// No description provided for @location_address.
  ///
  /// In en, this message translates to:
  /// **'Location/Address'**
  String get location_address;

  /// No description provided for @please_enter_location.
  ///
  /// In en, this message translates to:
  /// **'Please enter location'**
  String get please_enter_location;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @financial_information.
  ///
  /// In en, this message translates to:
  /// **'Financial Information'**
  String get financial_information;

  /// No description provided for @monthly_income.
  ///
  /// In en, this message translates to:
  /// **'Monthly Income'**
  String get monthly_income;

  /// No description provided for @please_enter_income.
  ///
  /// In en, this message translates to:
  /// **'Please enter income'**
  String get please_enter_income;

  /// No description provided for @number_dependents.
  ///
  /// In en, this message translates to:
  /// **'Number of Dependents'**
  String get number_dependents;

  /// No description provided for @please_enter_dependents_count.
  ///
  /// In en, this message translates to:
  /// **'Please enter dependents count'**
  String get please_enter_dependents_count;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save_beneficiary.
  ///
  /// In en, this message translates to:
  /// **'Save Beneficiary'**
  String get save_beneficiary;

  /// No description provided for @beneficiary_saved_successfully.
  ///
  /// In en, this message translates to:
  /// **'Beneficiary saved successfully!'**
  String get beneficiary_saved_successfully;

  /// No description provided for @search_beneficiaries.
  ///
  /// In en, this message translates to:
  /// **'Search beneficiaries...'**
  String get search_beneficiaries;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @manage_roles_permissions_your_organization.
  ///
  /// In en, this message translates to:
  /// **'Manage roles and permissions for your organization'**
  String get manage_roles_permissions_your_organization;

  /// No description provided for @add_new_role.
  ///
  /// In en, this message translates to:
  /// **'Add New Role'**
  String get add_new_role;

  /// No description provided for @role_name.
  ///
  /// In en, this message translates to:
  /// **'Role Name'**
  String get role_name;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit_user.
  ///
  /// In en, this message translates to:
  /// **'Edit User'**
  String get edit_user;

  /// No description provided for @addition.
  ///
  /// In en, this message translates to:
  /// **'Addition'**
  String get addition;

  /// No description provided for @permissions.
  ///
  /// In en, this message translates to:
  /// **'Permissions:'**
  String get permissions;

  /// No description provided for @users.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get users;

  /// No description provided for @feature_coming_soon.
  ///
  /// In en, this message translates to:
  /// **'Feature coming soon - '**
  String get feature_coming_soon;

  /// No description provided for @delete_role.
  ///
  /// In en, this message translates to:
  /// **'Delete Role'**
  String get delete_role;

  /// No description provided for @are_sure_want_delete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete'**
  String get are_sure_want_delete;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;
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
