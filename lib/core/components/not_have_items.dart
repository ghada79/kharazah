import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/styles_manager.dart';
import '../utils/color_mananger.dart';

class NotHaveItems extends StatelessWidget {
  String message;
  IconData icon;

  NotHaveItems({required this.message, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80.sp,
            color: ColorManager.primary,
          ),
          SizedBox(height: 16.h),
          Text(
            message,
            style: getBoldStyle(color: Colors.grey, fontSize: 20.sp),
          ),
        ],
      ),
    );

  }
}
