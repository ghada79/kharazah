import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kharazah/config/routes/routes.dart';
import 'package:kharazah/core/components/custom_botton.dart';
import 'package:kharazah/core/utils/styles_manager.dart';
import '../../../../../core/utils/color_mananger.dart';
import '../widgets/custom_shape_pinter.dart';

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
                height: 200.h, // Adjust height as needed
                child: CustomPaint(
                  painter: CurvedShapePainter(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w), // Adjust padding as needed
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      'Login',
                      style: getBoldStyle(color: ColorManager.primary, fontSize: 32.sp),
                    ),
                    Text(
                      'Welcome Back To Kharazah',
                      style: getMediumStyle(color: ColorManager.primary.withOpacity(0.9), fontSize: 20.sp),
                    ),
                    SizedBox(height: 32.h),
                    IntlPhoneField(
                      decoration: InputDecoration(
                        focusColor: ColorManager.primary,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          borderSide: BorderSide(color: ColorManager.primary,)
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                      ),
                      initialCountryCode: 'EG',
                      style: getMediumStyle(color: ColorManager.primary, fontSize: 16.sp),
                      dropdownTextStyle: getMediumStyle(color: ColorManager.primary, fontSize: 14.sp),
                    ),
                    SizedBox(height: 32.h),
                    CustomBotton(
                      text: 'Login',
                      color: ColorManager.primary,
                      onTap: () {
                        // todo: Go to Home Page
                        context.go(Routes.homeScreenRoute);
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
