import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:management/l10n/l10n.dart';
import '../../core/style/app_colors.dart';
import 'main_text.dart';

const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
const fillColor = AppColors.scaffoldColor;
const borderColor = Color(0xff4D4D4D);

// ignore: must_be_immutable
class CustomTextForm extends StatelessWidget {
  final TextEditingController? myController;
  final void Function(String)? onComplete;
  final Function(bool)? onEditing;
  void Function(String)? onChanged;
  void Function()? onTap;
  bool readOnly;
  bool? enabled;
  FocusNode? focusNode;
  final String? initialCountryCode;
  final String? Function(PhoneNumber?)? validator;
  final void Function(PhoneNumber)? onChangedPhoneNumber;

  CustomTextForm({
    super.key,
    this.myController,
    this.onChangedPhoneNumber,
    this.initialCountryCode,
    this.onComplete,
    this.onEditing,
    this.onChanged,
    this.onTap,
    this.enabled = true,
    this.readOnly = false,
    this.focusNode,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: myController,
      decoration: InputDecoration(
        //labelText: context.l10n.phone_number,
        hintText: context.l10n.phone_number,
      ),
      initialCountryCode: initialCountryCode ?? 'OM',
      onChanged: onChangedPhoneNumber,
      validator: (phone) {
        if (validator != null) {
          return validator!(phone);
        }
        if (phone == null || phone.completeNumber.isEmpty) {
          return context.l10n.please_enter_your_phone_number;
        }
        return null;
      },
      disableLengthCheck: false,
    );
  }
}

class CustomDropDownField extends StatefulWidget {
  final Widget? preFix;
  final Widget? suFix;
  final Color? suFixIconColor;
  final Color? preFixIconColor;
  final String? hintText;
  final double? fontHintSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? paddingContent;
  final Color? color;
  final double borderRadius;
  final Color enabledBorderColor;
  final List<DropdownMenuItem<dynamic>>? items;
  final dynamic value;
  final void Function(dynamic)? onChanged;
  final String? label;
  final double? labelSize;
  final double? space;
  final FontWeight labelWeight;

  const CustomDropDownField({
    super.key,
    this.preFix,
    this.suFix,
    this.suFixIconColor,
    this.preFixIconColor,
    this.hintText,
    this.fontHintSize,
    this.fontWeight,
    this.paddingContent,
    this.color,
    this.borderRadius = 8.0,
    this.enabledBorderColor = Colors.grey,
    this.label,
    this.labelSize,
    this.labelWeight = FontWeight.w400,
    this.space,
    required this.items,
    this.value,
    required this.onChanged,
  });

  @override
  State<CustomDropDownField> createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          MainText(
            widget.label ?? '',
            fontSize: widget.labelSize ?? 16,
            fontWeight: widget.labelWeight,
          ),
          SizedBox(
            height: widget.space,
          ),
        ],
        DropdownButtonFormField(
          decoration: InputDecoration(
            prefixIcon: widget.preFix,
            suffixIcon: widget.suFix,
            suffixIconColor: widget.suFixIconColor,
            prefixIconColor: widget.preFixIconColor,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: widget.fontHintSize ?? 13,
              color: Colors.grey,
              fontWeight: widget.fontWeight,
            ),
            contentPadding: widget.paddingContent ??
                const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            filled: true,
            fillColor:
            widget.color ?? Theme.of(context).scaffoldBackgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(color: Colors.yellow),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: widget.enabledBorderColor,
              ),
            ),
          ),
          items: widget.items,
          value: widget.value,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
