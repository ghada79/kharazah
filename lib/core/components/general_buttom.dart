import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_mananger.dart';
import '../utils/styles_manager.dart';

class GeneralButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  final Color color;
  final Color outlineColor;

  const GeneralButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.color,
      required this.outlineColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 160.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4.sp),
          border: Border.all(color: outlineColor),
        ),
        child: Center(
            child: Text(
          title!,
          style: getBoldStyle(color: ColorManager.white, fontSize: 18.sp),
        )),
      ),
    );
  }
}
