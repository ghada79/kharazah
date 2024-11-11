import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kharazah/core/components/custom_all_screens_appbar.dart';
import 'package:kharazah/core/utils/assets_manager.dart';
import 'package:kharazah/core/utils/color_mananger.dart';

class ItemOfListview extends StatelessWidget {
  const ItemOfListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: ColorManager.secondaryPrimary.withOpacity(0.5)
      ),
      child: Column(
        children: [
          Image.asset(ImageAssets.cake , height: 20, width:150.w,)
        ],
      ),
    );
  }
}
