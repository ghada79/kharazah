import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../config/routes/routes.dart';
import '../utils/color_mananger.dart';
import '../utils/styles_manager.dart';

class CustomAppbarAllScreens extends StatelessWidget {
  final String title;

  const CustomAppbarAllScreens({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title , style: getMediumStyle(color: ColorManager.white, fontSize: 18.sp)),
      backgroundColor: ColorManager.primary,
      toolbarHeight: 90.h,
      actions: [
        IconButton(onPressed: (){
          context.go(Routes.mainLayOutRoute);
          }, icon: const Icon(Icons.arrow_forward , color: ColorManager.white,))
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16.r),
        ),
      ),
    );
  }
}
