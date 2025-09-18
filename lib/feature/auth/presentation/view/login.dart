import 'package:flutter/material.dart';
import 'package:keyboard_area_handler/keyboard_area_handler.dart';
import 'package:management/core/extension/extension_helper.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_textfield.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../shared/widgets/app_logo.dart';
import '../../../../shared/widgets/easy_button.dart';
import '../../../../shared/widgets/main_text.dart';
import '../../../dash_board/presentation/dash_board.dart';
import 'forget_password_email.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const String routeName = '/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController(
    text: 'y50@gmail.com',
  );
  final TextEditingController _passwordController = TextEditingController(
    text: 'jfjffiigig',
  );
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: KeyboardAreaHandler(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  80.ph,
                  // شعار التطبيق
                  AppLogo(),
                  16.ph,
                  // عنوان الشاشة
                  MainText(
                    context.l10n.welcome,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  16.ph,
                  // بطاقة معلومات الدخول
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.95),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withValues(alpha: 0.1),
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
                              context.l10n.login,
                              color: AppColors.darkGreen,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            16.ph,
                            // حقل البريد الإلكتروني
                            MainTextField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              textDirection:
                                  context.isArabic
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                              label: context.l10n.email_userName,
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: AppColors.primaryColor,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return context.l10n.email_validation;
                                }
                                if (!RegExp(
                                  r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                                ).hasMatch(value)) {
                                  return context.l10n.email_validation_error;
                                }
                                return null;
                              },
                            ),
                            16.ph,
                            // حقل كلمة المرور
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
                                  return context.l10n.password_validation_size;
                                }
                                return null;
                              },
                            ),

                            // زر نسيت كلمة المرور
                            Align(
                              alignment:
                                  context.isArabic
                                      ? Alignment.centerLeft
                                      : Alignment.centerRight,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    ForgetPasswordEmailView.routeName,
                                  );
                                },
                                child: MainText(
                                  context.l10n.forget_password,
                                  color: AppColors.tertiaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            16.ph,
                            // زر تسجيل الدخول
                            LoadingButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  // عملية تسجيل الدخول
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    DashboardScreen.routeName,
                                    (route) => false,
                                  );
                                }
                              },
                              name: context.l10n.login,
                            ),
                            8.ph,
                          ],
                        ),
                      ),
                    ),
                    // زر إنشاء حساب جديد
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       context.l10n.do_not_have_account,
                    //       style: TextStyle(fontSize: 16),
                    //     ),
                    //     TextButton(
                    //       onPressed: () {
                    //         Navigator.pushNamed(
                    //           context,
                    //           RegisterView.routeName,
                    //         );
                    //       },
                    //       child: MainText(
                    //         context.l10n.create_account,
                    //         color: AppColors.goldAccent,
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    //LanguageSelectorSection(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
