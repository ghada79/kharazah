import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kharazah/config/routes/routes.dart';
import 'package:kharazah/core/components/custom_all_screens_appbar.dart';
import 'package:kharazah/core/utils/color_mananger.dart';
import 'package:kharazah/core/utils/styles_manager.dart';
import 'package:kharazah/features/home_screen/presentation/widgets/item_of_listview.dart';

import '../widgets/pattern.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.secondaryPrimary.withOpacity(0.5),
        toolbarHeight: 80.h, // Reduced toolbar height
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Delivery To',
              style: getBoldStyle(color: ColorManager.black, fontSize: 16.sp),
            ),
            Row(
              children: [
                Text(
                  'Jeddah',
                  style: getMediumStyle(color: ColorManager.primary, fontSize: 14.sp),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: ColorManager.primary,
                ),
              ],
            ),
          ],
        ),
        leading: Padding(
          padding: EdgeInsets.all(8.w),
          child: Icon(
            Icons.delivery_dining,
            color: ColorManager.primary,
            size: 28.sp, // Reduced icon size
          ),
        ),
      ),
      body: SingleChildScrollView( // Wrap entire content in a SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 12.h), // Reduced space for more compact layout
              ShaderMask(
                shaderCallback: (bounds) {
                  return createCircularPattern(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: InkWell(
                  onTap: () {
                    context.go(Routes.bakingRoute);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 70.h, // Reduced container height
                    padding: EdgeInsets.all(12.w), // Adjusted padding
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorManager.secondaryPrimary.withOpacity(0.3),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.cake,
                          color: ColorManager.primary,
                          size: 40.sp, // Adjusted icon size
                        ),
                        SizedBox(width: 12.w), // Reduced space between icon and text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Make your own cake!',
                                style: getBoldStyle(color: ColorManager.primary, fontSize: 18.sp), // Adjusted font size
                              ),
                              Text(
                                'No one can do it better than you',
                                style: getMediumStyle(color: ColorManager.black, fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                'Hope Collection',
                style: getBoldStyle(color: ColorManager.black, fontSize: 22.sp), // Adjusted font size
              ),
              SizedBox(height: 12.h),
              SizedBox(
                height: 190.h, // Set fixed height for each horizontal ListView row
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 12.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) => ItemOfListview(),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                'Hope Collection',
                style: getBoldStyle(color: ColorManager.black, fontSize: 22.sp),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                height: 190.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 12.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) => ItemOfListview(),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                'Hope Collection',
                style: getBoldStyle(color: ColorManager.black, fontSize: 22.sp),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                height: 190.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 12.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) => ItemOfListview(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
