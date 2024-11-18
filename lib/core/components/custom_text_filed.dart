import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_mananger.dart';
import '../utils/styles_manager.dart';

class CustomTextFiled extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final BorderRadius borderRadius;

  const CustomTextFiled({
    required this.hintText,
    required this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon ,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: ColorManager.lightGray.withOpacity(0.5),
        hintText: hintText,
        hintStyle: getMediumStyle(
            color: ColorManager.secondaryColor.withOpacity(0.4),
            fontSize: 14.sp),
        border: OutlineInputBorder(
          borderRadius: borderRadius,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(
            color: ColorManager.red,
          ),
        ),
      ),
    );
  }
}
