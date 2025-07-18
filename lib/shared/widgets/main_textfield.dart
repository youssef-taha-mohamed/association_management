import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/style/app_colors.dart';

class MainTextField extends StatefulWidget {
  final String? hint;
  final String? label;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? maxLength;
  final bool isDense;
  final EdgeInsetsGeometry? contentPadding;
  final bool readOnly;
  final bool enabled;
  final FocusNode? currentFocusNode;
  final bool unFocusWhenTapOutside;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final BoxConstraints? prefixIconConstraints;
  final String? initialCode;
  final String? helperText;
  final Function(CountryCode)? onCounteryCodeChange;
  final String? autofillHints;
  final TextDirection? textDirection;
  final bool showClearButton;

  const MainTextField({
    super.key,
    this.hint,
    this.label,
    this.textStyle,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
    this.maxLength,
    this.isDense = true,
    this.contentPadding,
    this.readOnly = false,
    this.enabled = true,
    this.currentFocusNode,
    this.unFocusWhenTapOutside = false,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.validator,
    this.onCounteryCodeChange,
    this.isPassword = false,
    this.initialCode,
    this.helperText,
    this.prefixIconConstraints,
    this.autofillHints,
    this.textDirection,
    this.showClearButton = true,
  });

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  late bool _obscureText;
  late TextEditingController _controller;
  bool _hasText = false;
  late FocusNode _focusNode;
  String? _errorMessage;
  bool _wasValidated = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    _controller = widget.controller ?? TextEditingController();
    _hasText = _controller.text.isNotEmpty;
    _focusNode = widget.currentFocusNode ?? FocusNode();

    // Add listeners
    _controller.addListener(_handleTextChange);
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;

      // When field loses focus, validate if it has content
      if (!_isFocused) {
        _wasValidated = true;
        if (_controller.text.isEmpty) {
          _errorMessage = widget.validator?.call(_controller.text);
        } else {
          _errorMessage = null;
        }
      }
    });
  }

  void _handleTextChange() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;

      // Clear error message immediately when typing starts
      if (_hasText) {
        _errorMessage = null;
      } else if (_wasValidated) {
        // Show error if field was previously validated and is now empty
        _errorMessage = widget.validator?.call(_controller.text);
      }
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_handleTextChange);
    }
    if (widget.currentFocusNode == null) {
      _focusNode.removeListener(_handleFocusChange);
      _focusNode.dispose();
    }
    super.dispose();
  }

  Widget? _buildSuffixIcon() {
    if (widget.isPassword) {
      return IconButton(
        onPressed: () => setState(() => _obscureText = !_obscureText),
        icon: Icon(
          _obscureText ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
          size: 20,
        ),
      );
    } else if (widget.showClearButton && _hasText) {
      return IconButton(
        onPressed: () {
          _controller.clear();
          if (widget.onChanged != null) {
            widget.onChanged!('');
          }
        },
        icon: const Icon(
          CupertinoIcons.clear_circled_solid,
          size: 20,
        ),
      );
    } else {
      return widget.suffixIcon;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints:
          widget.autofillHints != null ? [widget.autofillHints!] : null,
      controller: widget.controller,
      focusNode: widget.currentFocusNode,
      textDirection: widget.textDirection,
      style: widget.textStyle ??
          const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      obscureText: _obscureText,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      validator: (value) {
        if (widget.validator != null) {
          _wasValidated = true;
          _errorMessage = widget.validator!(value);
          if (mounted) {
            setState(() {});
          }
          return _errorMessage;
        }
        return null;
      },
      onFieldSubmitted: widget.onSubmitted,
      onTap: widget.onTap,
      onTapOutside: (event) {
        if (widget.unFocusWhenTapOutside) {
          FocusScope.of(context).unfocus();
        }
      },
      decoration: InputDecoration(
        labelText: widget.label,
        helperText: widget.helperText,
        prefixIconConstraints: widget.prefixIconConstraints,
        isDense: widget.isDense,
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: widget.prefixIcon,
              )
            : null,
        suffixIcon: _buildSuffixIcon(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              color: _errorMessage != null
                  ? AppColors.error
                  : _isFocused
                      ? AppColors.primaryColor
                      : AppColors.grey,
              width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              color:
                  _errorMessage != null ? AppColors.error : AppColors.grey300,
              width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              color: _errorMessage != null
                  ? AppColors.error
                  : AppColors.primaryColor,
              width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.error,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.error,
            width: 2,
          ),
        ),
        suffix: widget.suffix,
        hintText: widget.hint,
        counterText: '', // Removes the character counter
      ),
    );
  }
}

class MainMultiLinesTextField extends StatefulWidget {
  const MainMultiLinesTextField({
    super.key,
    this.hint = '',
    this.fontWeight,
    this.colorText,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.init,
    this.maxInputLength,
    this.border,
    this.isDense = true,
    this.contentPadding,
    this.filledColor = const Color(0xFFFFFFFF),
    this.suffix,
    this.onSubmit,
    this.enable = true,
    this.style,
    this.hideKeyboard = false,
    this.borderColor,
    this.suffixIcon,
    this.unFocusWhenTapOutside = false,
    this.onTap,
    this.onChanged,
    this.controller,
    this.obscureText = false,
    this.validator,
  });

  final String hint;
  final FontWeight? fontWeight;
  final Color? colorText;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final int? maxLines;
  final String? init;
  final bool isDense;
  final EdgeInsets? contentPadding;
  final TextStyle? style;
  final int? maxInputLength;
  final bool hideKeyboard;
  final OutlineInputBorder? border;
  final Color? filledColor;
  final Color? borderColor;
  final bool enable;
  final void Function(String value)? onSubmit;
  final bool unFocusWhenTapOutside;
  final void Function()? onTap;
  final void Function(String value)? onChanged;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String? value)? validator;

  @override
  State<MainMultiLinesTextField> createState() =>
      _MainMultiLinesTextFieldState();
}

class _MainMultiLinesTextFieldState extends State<MainMultiLinesTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorHeight: 22.0,
      enabled: widget.enable,
      maxLines: widget.maxLines,
      maxLength: widget.maxInputLength,
      onFieldSubmitted: widget.onSubmit,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      validator: widget.validator,
      style: widget.style ??
          const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onTapOutside: (event) {
        if (widget.unFocusWhenTapOutside) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      decoration: InputDecoration(
        isDense: widget.isDense,
        prefixIcon: widget.prefixIcon,
        suffix: widget.suffix,
        contentPadding: widget.contentPadding,
        hintText: widget.hint.isNotEmpty ? widget.hint : null,
        hintStyle: const TextStyle(
          fontSize: 13,
          color: AppColors.grey,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
