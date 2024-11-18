import 'package:flutter/material.dart';
import 'package:kharazah/core/components/custom_botton.dart';
import 'package:kharazah/core/utils/color_mananger.dart';

class OrderButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const OrderButton({
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBotton(
      text: text,
      color: ColorManager.primary,
      onTap: onTap,
      width: double.infinity,
    );
  }
}
