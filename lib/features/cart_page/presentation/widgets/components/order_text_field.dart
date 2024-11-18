import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kharazah/core/utils/color_mananger.dart';
import 'package:kharazah/core/utils/styles_manager.dart';

class OrderTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const OrderTextField({
    required this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.secondaryColor,
        labelText: labelText,
        labelStyle:
            getMediumStyle(color: ColorManager.primary, fontSize: 14.sp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorManager.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorManager.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorManager.white, width: 2),
        ),
      ),
      style: TextStyle(color: ColorManager.white),
    );
  }
}
