import 'package:flutter/material.dart';
import 'package:management/core/extension/extension_helper.dart';
import 'package:management/l10n/l10n.dart';
import 'app_colors.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  final Color? textColor;

  const ScreenTitle({
    super.key,
    required this.title,
    this.textColor = AppColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: textColor,
        fontSize: 30,
      ),
    );
  }
}

class Headline1 extends StatelessWidget {
  final String smallText;
  final String bigText;

  const Headline1({
    super.key,
    required this.smallText,
    required this.bigText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          smallText,
          style: const TextStyle(fontSize: 30),
        ),
        const SizedBox(width: 5),
        Text(
          bigText,
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class Headline extends StatelessWidget {
  final String sectionTitle;
  final bool trailing;
  final VoidCallback? onPressed;
  final String? trailingTitle;
  final Color? color;
  final double fontSize;
  final double trailingFontSize;

  const Headline({
    super.key,
    required this.sectionTitle,
    this.trailing = false,
    this.onPressed,
    this.trailingTitle,
    this.fontSize = 20.0,
    this.color = AppColors.primaryColor,
    this.trailingFontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          sectionTitle,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: color,
            fontWeight: FontWeight.normal,
            fontSize: fontSize,
          ),
        ),
        const Spacer(),
        if (trailing)
          GestureDetector(
            onTap: onPressed,
            child: Text(
              trailingTitle ?? context.l10n.see_all,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.primaryColor,
                fontSize: trailingFontSize,
              ),
            ),
          ),
      ],
    );
  }
}

class MainHeadline extends StatelessWidget {
  final String title;
  Color? color;
  final double fontSize;
  final EdgeInsetsGeometry? margin;
  final bool isTitle;
  final FontWeight fontWeight;
  final TextAlign align;

   MainHeadline({
    super.key,
    this.isTitle = false,
    required this.title,
    this.fontSize = 20.0,
    this.align = TextAlign.center,
    this.fontWeight = FontWeight.bold,
    this.color,
    this.margin = const EdgeInsets.only(bottom: 10),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text(
        title,
        maxLines: isTitle ? 1 : 3,
        textAlign: align,
        style: TextStyle(
          color: context.isDark ? color = AppColors.white : color = AppColors.primaryColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class SmallHeadline extends StatelessWidget {
  final String title;
  final Color? color;
  final double? size;
  final TextAlign align;
  final FontWeight fontWeight;

  const SmallHeadline({
    super.key,
    required this.title,
    this.color,
    this.size,
    this.fontWeight = FontWeight.w400,
    this.align = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
      ),
    );
  }
}
