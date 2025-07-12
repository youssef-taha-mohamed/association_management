import 'dart:math';
import 'package:flutter/material.dart';
import 'package:management/core/extension/extension_helper.dart';
import 'package:management/feature/auth/presentation/view/register.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_textfield.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../shared/widgets/app_logo.dart';
import '../../../../shared/widgets/custom_background.dart';
import '../../../../shared/widgets/custom_language.dart';
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
    text: 'yt48750@gmail.com',
  );
  final TextEditingController _passwordController = TextEditingController(
    text: 'jfjffiigig'
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
      body: Stack(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //       colors: [
          //         AppColors.darkGreen.withOpacity(0.9),
          //         AppColors.primaryColor.withOpacity(0.8),
          //       ],
          //     ),
          //   ),
          //   child: CustomPaint(
          //     painter: BackgroundPatternPainter(),
          //     child: Container(),
          //   ),
          // ),
          // EnhancedIslamicBackground(
          //   primaryColor: AppColors.darkGreen,
          //   secondaryColor: Colors.white,
          //   opacity: 0.1,
          // ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    16.ph,
                    // شعار التطبيق
                    AppLogo(),
                    16.ph,
                    // عنوان الشاشة
                    MainText(
                      context.l10n.welcome_to_konoz,
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
                                textDirection: context.isArabic
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
                                          r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(value)) {
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
                                textDirection: context.isArabic
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
                                        .l10n.password_validation_size;
                                  }
                                  return null;
                                },
                              ),

                              // زر نسيت كلمة المرور
                              Align(
                                alignment: context.isArabic
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
                    ),
                    8.ph,
                    // زر إنشاء حساب جديد
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.l10n.do_not_have_account,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RegisterView.routeName,
                            );
                          },
                          child: MainText(
                            context.l10n.create_account,
                            color: AppColors.goldAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    LanguageSelectorSection(),
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

// رسام نمط الخلفية الإسلامية
class BackgroundPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    // رسم شكل نجمة إسلامية
    void drawIslamicStar(Canvas canvas, Offset center, double size) {
      final Path path = Path();
      final double radius = size / 2;

      for (int i = 0; i < 8; i++) {
        final double angle = (i * 45) * (3.14159 / 180);
        final double x = center.dx + radius * cos(angle);
        final double y = center.dy + radius * sin(angle);

        if (i == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }

      path.close();
      canvas.drawPath(path, paint);
    }

    // نمط نجوم متكررة على الخلفية
    for (int i = 0; i < 20; i++) {
      for (int j = 0; j < 30; j++) {
        final double x = (size.width / 20) * i;
        final double y = (size.height / 30) * j;
        drawIslamicStar(canvas, Offset(x, y), 20);
      }
    }

    // رسم أقواس إسلامية على حدود الصفحة
    final Path borderPath = Path();
    final double arcSize = size.width / 12;

    // أقواس علوية
    for (int i = 0; i < 12; i++) {
      final double startX = i * arcSize;
      final double endX = (i + 1) * arcSize;
      final double midX = (startX + endX) / 2;

      if (i % 2 == 0) {
        borderPath.moveTo(startX, 0);
        borderPath.quadraticBezierTo(midX, arcSize / 2, endX, 0);
      }
    }

    // أقواس سفلية
    for (int i = 0; i < 12; i++) {
      final double startX = i * arcSize;
      final double endX = (i + 1) * arcSize;
      final double midX = (startX + endX) / 2;

      if (i % 2 == 0) {
        borderPath.moveTo(startX, size.height);
        borderPath.quadraticBezierTo(
            midX, size.height - arcSize / 2, endX, size.height);
      }
    }

    canvas.drawPath(borderPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
