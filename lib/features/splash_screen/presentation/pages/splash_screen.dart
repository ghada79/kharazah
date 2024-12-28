import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/routes/routes.dart';
import '../../../../core/utils/color_mananger.dart';
import '../../../../core/utils/styles_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      context.go(Routes.loginRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: Image.asset(
        'assets/images/logo.png', // مسار الصورة
        width: 150.w, // عرض الصورة (اختياري)
        height: 150.h, // ارتفاع الصورة (اختياري)
        fit: BoxFit.contain, // لتحديد كيفية عرض الصورة
    )),
    );
  }
}