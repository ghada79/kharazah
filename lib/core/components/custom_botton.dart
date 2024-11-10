import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_mananger.dart';
import '../utils/styles_manager.dart';

class CustomBotton extends StatelessWidget {
  String text;
  VoidCallback? onTap;
  Color color = ColorManager.primary;
  double width ;

  CustomBotton({Key? key, required this.text , required this.color , required this.onTap , required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 200.w,
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: color,
        ),
        child: Center(
          child: Text(text,
              style: getMediumStyle(color: ColorManager.white, fontSize: 16.sp)),
        ),
      ),
    );
  }
}
