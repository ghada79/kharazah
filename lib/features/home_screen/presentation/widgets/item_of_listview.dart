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
      padding: EdgeInsets.all(8.w), // Adjust padding based on screen size
      width: 150.w, // Width adapts to screen width
      height: 200.h, // Adjust height for better aspect ratio on all devices
      decoration: BoxDecoration(
        color: ColorManager.secondaryPrimary.withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns all text to start
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              ImageAssets.cake2,
              height: 100.h, // Image scales with screen height
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8.h), // Responsive space between elements
          Expanded(
            flex: 1,
            child: Text(
              'Chocolate Cake From AlAbd',
              style: getMediumStyle(color: ColorManager.black, fontSize: 14.sp), // Font scales with screen size
              textAlign: TextAlign.left, // Aligns text to the left
            ),
          ),
          Text(
            'Delicious and freshly baked',
            style: getMediumStyle(color: ColorManager.black.withOpacity(0.7), fontSize: 12.sp),
            textAlign: TextAlign.left, // Aligns text to the left
          ),
          Text(
            '220 SAR',
            style: getBoldStyle(color: ColorManager.primary, fontSize: 16.sp),
            textAlign: TextAlign.left, // Aligns text to the left
          ),

        ],
      ),
    );
  }
}
