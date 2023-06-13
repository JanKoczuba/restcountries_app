import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resource/app_color.dart';

export 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    Key? key,
    this.hint,
    this.autofocus = false,
    this.obscureText = false,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.suffix,
    this.inputFormatters,
    this.maxLines = 1,
    this.controller,
    this.errorMaxLines = 10,
    this.maxLength,
    this.maxLengthEnforcement,
  }) : super(key: key);

  final bool autofocus;
  final bool obscureText;
  final String? initialValue;
  final String? hint;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final int errorMaxLines;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: autofocus,
      obscureText: obscureText,
      initialValue: initialValue,
      onChanged: onChanged,
      keyboardType: keyboardType,
      validator: validator,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      maxLines: maxLines,
      decoration: InputDecoration(
        errorMaxLines: errorMaxLines,
        hintText: hint,
        filled: true,
        suffix: suffix,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 8,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.inputBorder,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.error,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.error,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
