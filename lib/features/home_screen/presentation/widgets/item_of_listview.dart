import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kharazah/core/utils/assets_manager.dart';
import 'package:kharazah/core/utils/color_mananger.dart';
import 'package:kharazah/core/utils/styles_manager.dart';

class ItemOfListview extends StatelessWidget {
  const ItemOfListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.w),
      width: 130.w,
      decoration: BoxDecoration(
        color: ColorManager.secondaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                ImageAssets.cake2,
                height: 80.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              'Chocolate Cake From AlAbd',
              style: getMediumStyle(color: ColorManager.black, fontSize: 10.sp),
              textAlign: TextAlign.left,
            ),
            Text(
              'Delicious and freshly baked',
              style: getMediumStyle(color: ColorManager.black.withOpacity(0.7), fontSize: 9.sp),
              textAlign: TextAlign.left,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '220 SAR',
                  style: getBoldStyle(color: ColorManager.primary, fontSize: 14.sp),
                  textAlign: TextAlign.left,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_circle, color: ColorManager.primary, size: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
