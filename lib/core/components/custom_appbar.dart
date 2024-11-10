import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/color_mananger.dart';
import '../utils/styles_manager.dart';

class CustomAppbar extends StatelessWidget {
  final String title;

  const CustomAppbar({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title , style: getMediumStyle(color: ColorManager.white, fontSize: 18.sp)),
      backgroundColor: ColorManager.primary,
      toolbarHeight: 90.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16.r),
        ),
      ),
    );
  }
}
