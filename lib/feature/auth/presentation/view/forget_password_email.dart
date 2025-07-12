import 'package:flutter/material.dart';
import 'package:management/core/extension/extension_helper.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_textfield.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../shared/widgets/app_logo.dart';
import '../../../../shared/widgets/custom_back.dart';
import '../../../../shared/widgets/custom_background.dart';
import '../../../../shared/widgets/easy_button.dart';
import '../../../../shared/widgets/main_text.dart';
import 'otp_verification_password.dart';

class ForgetPasswordEmailView extends StatefulWidget {
  const ForgetPasswordEmailView({super.key});

  static const String routeName = '/forget-password-email';

  @override
  State<ForgetPasswordEmailView> createState() =>
      _ForgetPasswordEmailViewState();
}

class _ForgetPasswordEmailViewState extends State<ForgetPasswordEmailView> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية الإسلامية المحسنة
          EnhancedIslamicBackground(
            primaryColor: AppColors.darkGreen,
            secondaryColor: Colors.white,
            opacity: 0.1,
          ),

          // محتوى الشاشة
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   Row(
                     children: [
                       Align(
                         alignment: context.isArabic ? Alignment.centerRight : Alignment.centerLeft,
                         child: MyBackButton(
                           margin: EdgeInsets.zero,
                           size: 60,
                         ),
                       ),
                     ],
                   ),
                    16.ph,
                    // شعار التطبيق
                    AppLogo(),
                    16.ph,
                    // عنوان الشاشة
                    MainText(
                      context.l10n.forget_password,
                      color: AppColors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                    8.ph,
                    MainText(
                      context.l10n.enter_your_email_to_reset_your_password,
                      color: AppColors.goldAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                    ),
                    16.ph,
                    // بطاقة إدخال البريد الإلكتروني
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
                                context.l10n.recover_password,
                                color: AppColors.darkGreen,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              16.ph,
                              // حقل البريد الإلكتروني
                              MainTextField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                textDirection: context.isArabic ? TextDirection.rtl : TextDirection.ltr,
                                label: context.l10n.email,
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: AppColors.primaryColor,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context.l10n.email_validation;
                                  }
                                  if (!RegExp(
                                          r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(value)) {
                                    return context.l10n.email_validation_error;
                                  }
                                  return null;
                                },
                              ),
                              24.ph,
                              // زر الإرسال
                              LoadingButton(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    // ارسال البريد الإلكتروني
                                    Navigator.pushNamed(
                                      context,
                                      OtpVerificationView.routeName,
                                    );
                                  }
                                },
                                name: context.l10n.send_code,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // 16.ph,
                    // // زر العودة
                    // TextButton(
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //   },
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       Icon(
                    //         context.isArabic
                    //             ? Icons.arrow_forward
                    //             : Icons.arrow_back,
                    //         color: AppColors.white,
                    //       ),
                    //       8.pw,
                    //       MainText(
                    //         "العودة لتسجيل الدخول",
                    //         color: AppColors.white,
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ],
                    //   ),
                    // ),
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
