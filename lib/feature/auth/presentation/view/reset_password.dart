import 'package:flutter/material.dart';
import 'package:management/core/extension/extension_helper.dart';
import 'package:management/feature/auth/presentation/view/login.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_textfield.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../shared/widgets/app_logo.dart';
import '../../../../shared/widgets/custom_back.dart';
import '../../../../shared/widgets/custom_background.dart';
import '../../../../shared/widgets/easy_button.dart';
import '../../../../shared/widgets/main_text.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  static const String routeName = '/reset-password';

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                      context.l10n.change_password,
                      color: AppColors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                    8.ph,
                    MainText(
                      context.l10n.change_password_desc,
                      color: AppColors.goldAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                    ),
                    24.ph,
                    // بطاقة إدخال كلمة المرور الجديدة
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
                                context.l10n.new_password,
                                color: AppColors.darkGreen,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              16.ph,
                              // حقل كلمة المرور الجديدة
                              MainTextField(
                                controller: _passwordController,
                                isPassword: true,
                                label: context.l10n.new_password,
                                textDirection: context.isArabic ? TextDirection.rtl : TextDirection.ltr,
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
                              16.ph,
                              // حقل تأكيد كلمة المرور
                              MainTextField(
                                controller: _confirmPasswordController,
                                isPassword: true,
                                label: context.l10n.confirm_password,
                                textDirection: context.isArabic ? TextDirection.rtl : TextDirection.ltr,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: AppColors.primaryColor,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context.l10n.confirm_password_validation;
                                  }
                                  if (value != _passwordController.text) {
                                    return context.l10n.passwords_do_not_match;
                                  }
                                  return null;
                                },
                              ),
                              24.ph,
                              // ملاحظات حول قوة كلمة المرور
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MainText(
                                      "كلمة المرور يجب أن تحتوي على:",
                                      color: AppColors.darkGreen,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    8.ph,
                                    _buildPasswordRule("6 أحرف على الأقل"),
                                    _buildPasswordRule("حرف كبير واحد على الأقل"),
                                    _buildPasswordRule("رقم واحد على الأقل"),
                                  ],
                                ),
                              ),
                              24.ph,
                              // زر حفظ كلمة المرور
                              LoadingButton(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    // تغيير كلمة المرور
                                    _showSuccessDialog(context);
                                  }
                                },
                                name: context.l10n.save_password,
                              ),
                            ],
                          ),
                        ),
                      ),
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

  // عنصر ويدجت لقواعد كلمة المرور
  Widget _buildPasswordRule(String rule) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_outline,
            color: AppColors.primaryColor,
            size: 16,
          ),
          8.pw,
          MainText(
            rule,
            color: AppColors.darkGreen,
            fontSize: 14,
          ),
        ],
      ),
    );
  }

  // عرض الحوار عند نجاح تغيير كلمة المرور
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: AppColors.primaryColor,
                size: 64,
              ),
              16.ph,
              MainText(
                "تم تغيير كلمة المرور بنجاح",
                color: AppColors.darkGreen,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              16.ph,
              MainText(
                "يمكنك الآن تسجيل الدخول باستخدام كلمة المرور الجديدة",
                color: AppColors.darkGrey,
                fontSize: 16,
                textAlign: TextAlign.center,
              ),
              24.ph,
              LoadingButton(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    LoginView.routeName,
                        (route) => false,
                  );
                },
                name: context.l10n.login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}