import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kharazah/config/routes/routes.dart';
import 'package:kharazah/core/components/custom_botton.dart';
import 'package:kharazah/core/utils/styles_manager.dart';
import '../../../../../core/utils/color_mananger.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200.h, // ضبط الارتفاع حسب الحاجة
                child: Image.asset(
                  'assets/login/carve-2 (1).jpg', // استبدلي بالمسار الصحيح للصورة
                  fit: BoxFit.cover, // لضبط احتواء الصورة
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      'Login',
                      style: getBoldStyle(
                          color: ColorManager.primary, fontSize: 32.sp),
                    ),
                    Text(
                      'Welcome Back To Kharazah',
                      style: getMediumStyle(
                          color: ColorManager.primary.withOpacity(0.9),
                          fontSize: 20.sp),
                    ),
                    SizedBox(height: 32.h),
                    IntlPhoneField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          borderSide: BorderSide(
                            color: ColorManager.primary,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                      ),
                      initialCountryCode: 'SA',
                      style: getMediumStyle(
                          color: ColorManager.primary, fontSize: 16.sp),
                      dropdownTextStyle: getMediumStyle(
                          color: ColorManager.primary, fontSize: 14.sp),
                    ),
                    SizedBox(height: 32.h),
                    CustomBotton(
                      text: 'Login',
                      color: ColorManager.primary,
                      onTap: () {
                        context.go(Routes.mainLayOut);
                      },
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
