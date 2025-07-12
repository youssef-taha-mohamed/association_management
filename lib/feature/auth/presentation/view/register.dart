import 'package:flutter/material.dart';
import 'package:management/core/extension/extension_helper.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_textfield.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../shared/widgets/app_logo.dart';
import '../../../../shared/widgets/custom_background.dart';
import '../../../../shared/widgets/easy_button.dart';
import '../../../../shared/widgets/main_text.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  static const String routeName = '/register';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Islamic Background Pattern (same as login screen)
          // EnhancedIslamicBackground(
          //   primaryColor: AppColors.darkGreen,
          //   secondaryColor: Colors.white,
          //   opacity: 0.1,
          // ),
          // Screen Content
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    16.ph,
                    // App Logo
                    AppLogo(),
                    16.ph,
                    // Screen Title
                    MainText(
                      context.l10n.create_account,
                      color: AppColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                    // 8.ph,
                    // MainText(
                    //   context.l10n.join_to_konoz,
                    //   color: AppColors.goldAccent,
                    //   fontSize: 16,
                    //   fontWeight: FontWeight.w500,
                    //   textAlign: TextAlign.center,
                    // ),
                    16.ph,
                    // Registration Form Card
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainText(
                                context.l10n.data_about_account,
                                color: AppColors.darkGreen,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              16.ph,
                              // Full Name Field
                              MainTextField(
                                controller: _nameController,
                                keyboardType: TextInputType.name,
                                label: context.l10n.full_name,
                                textDirection:
                                    context.isArabic
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: AppColors.primaryColor,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context.l10n.full_name_validation;
                                  }
                                  return null;
                                },
                              ),
                              16.ph,
                              MainTextField(
                                controller: _userNameController,
                                keyboardType: TextInputType.name,
                                label: context.l10n.user_name,
                                textDirection:
                                    context.isArabic
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: AppColors.primaryColor,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context.l10n.user_name_validation;
                                  }
                                  return null;
                                },
                              ),
                              16.ph,
                              // Email Field
                              MainTextField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                label: context.l10n.email,
                                textDirection:
                                    context.isArabic
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: AppColors.primaryColor,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context.l10n.email_va;
                                  }
                                  if (!RegExp(
                                    r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                                  ).hasMatch(value)) {
                                    return context.l10n.email_err;
                                  }
                                  return null;
                                },
                              ),
                              16.ph,
                              // Phone Number Field
                              MainTextField(
                                controller: _phoneController,
                                keyboardType: TextInputType.phone,
                                label: context.l10n.phone_number,
                                textDirection:
                                    context.isArabic
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                prefixIcon: Icon(
                                  Icons.phone_outlined,
                                  color: AppColors.primaryColor,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context
                                        .l10n
                                        .please_enter_your_phone_number;
                                  }
                                  return null;
                                },
                              ),
                              16.ph,
                              // Password Field
                              MainTextField(
                                controller: _passwordController,
                                isPassword: true,
                                label: context.l10n.password,
                                textDirection:
                                    context.isArabic
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: AppColors.primaryColor,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context.l10n.password_validation;
                                  }
                                  if (value.length < 6) {
                                    return context
                                        .l10n
                                        .password_validation_size;
                                  }
                                  return null;
                                },
                              ),
                              16.ph,
                              MainTextField(
                                controller: _confirmPasswordController,
                                isPassword: true,
                                label: context.l10n.confirm_password,
                                textDirection:
                                    context.isArabic
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: AppColors.primaryColor,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context
                                        .l10n
                                        .confirm_password_validation;
                                  }
                                  if (value != _passwordController.text) {
                                    return context.l10n.passwords_do_not_match;
                                  }
                                  return null;
                                },
                              ),
                              16.ph,
                              // Confirm Password Field
                              16.ph,
                              // Terms and Conditions Checkbox
                              Row(
                                children: [
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Checkbox(
                                      value: _agreeToTerms,
                                      activeColor: AppColors.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _agreeToTerms = value ?? false;
                                        });
                                      },
                                    ),
                                  ),
                                  10.pw,
                                  Expanded(
                                    child: MainText(
                                      context.l10n.terms,
                                      color: AppColors.darkGrey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              24.ph,
                              // Register Button
                              LoadingButton(
                                onTap: () {
                                  if (_formKey.currentState!.validate() &&
                                      _agreeToTerms) {
                                    // Registration Process
                                  } else if (!_agreeToTerms) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: MainText(
                                          context.l10n.terms_validation,
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },
                                name: context.l10n.register,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    8.ph,
                    // Login Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MainText(
                          context.l10n.you_have_account,
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate back to login screen
                            Navigator.of(context).pop();
                          },
                          child: MainText(
                            context.l10n.login,
                            color: AppColors.goldAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
