import 'package:flutter/material.dart';
import '../../core/style/app_colors.dart';
import 'main_button.dart';
import 'main_text.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    required this.name,
    required this.onTap,
    this.color,
    this.textColor,
    this.width,
    this.height,
    this.padding,
    this.isLoading = false,
    super.key,
  });

  final String name;
  final VoidCallback onTap;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final primaryColor = color ?? AppColors.primaryColor;

    final lighterColor = Color.lerp(primaryColor, Colors.white, 0.3);

    return MainButton(
      maximumSize: Size(width ?? double.infinity, height ?? 55),
      width: width ?? double.infinity,
      radius: 15.0,
      color: isLoading ? lighterColor : primaryColor,
      onPressed: isLoading ? () {} : onTap,
      child: isLoading
          ? const Center(
              child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            )
          : MainText(
              name,
              textAlign: TextAlign.center,
              color: textColor ?? AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
    );
  }
}
