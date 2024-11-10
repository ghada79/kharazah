import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kharazah/core/utils/styles_manager.dart';
import 'package:toastification/toastification.dart';

import 'color_mananger.dart';

class ToastUtils {

  static showErrorToast(String message , context , String description) {
    return toastification.show(
      context: context,
      type: ToastificationType.error,
      title: Text(message , style: getMediumStyle(color: ColorManager.white, fontSize: 14.sp)),
      description: Text(description , style: getMediumStyle(color: ColorManager.white, fontSize: 11.sp)),
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      icon: const Icon(Icons.error),
      showIcon: true, // show or hide the icon
      primaryColor: Colors.red,
      backgroundColor: Colors.white,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
    );
  }

  static showSuccessToast(String message , context , String description) {
    return toastification.show(
      context: context,
      type: ToastificationType.success,
      title: Text(message , style: getBoldStyle(color: ColorManager.white, fontSize: 14.sp)),
      description: Text(description , style: getMediumStyle(color: ColorManager.white, fontSize: 11.sp)),
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      icon: const Icon(Icons.check),
      showIcon: true, // show or hide the icon
      primaryColor: Colors.green,
      backgroundColor: Colors.white,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
    );
  }

}