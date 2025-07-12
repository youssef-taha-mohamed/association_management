import 'package:flutter/material.dart';
import '../../core/style/app_colors.dart';

class MainButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final bool expanded;
  final double radius;
  final Color? color;
  final double? elevation;
  final double? width;
  final double? verticalPadding;
  final double? horizontalPadding;
  final EdgeInsets? margin;
  final Size? minimumSize;
  final Size? maximumSize;

  const MainButton({
    super.key,
    required this.child,
    this.onPressed,
    this.expanded = true,
    this.radius = 12,
    this.width,
    this.color = AppColors.primaryColor,
    this.elevation,
    this.verticalPadding = 16,
    this.horizontalPadding,
    this.margin,
    this.minimumSize,
    this.maximumSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? (expanded ? double.infinity : null),
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          visualDensity: VisualDensity(
            vertical:
                verticalPadding != null ? VisualDensity.minimumDensity : 0.0,
            horizontal:
                horizontalPadding != null ? VisualDensity.minimumDensity : 0.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          backgroundColor: color,
          maximumSize: maximumSize,
          minimumSize: minimumSize,
          foregroundColor: AppColors.white,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? 0,
            horizontal: horizontalPadding ?? 0,
          ),
          child: child,
        ),
      ),
    );
  }
}
