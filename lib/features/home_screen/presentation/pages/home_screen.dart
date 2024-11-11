import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        toolbarHeight: 96.h,
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
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.delivery_dining,
            color: ColorManager.primary,
            size: 32.sp,
          ),
        ),
        leadingWidth: 32.w,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.h),
            ShaderMask(
              shaderCallback: (bounds) {
                return createCircularPattern(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: InkWell(
                onTap: (){
                  // todo : Navegate to make custom cake
                },
                child: Container(
                  width: double.infinity,
                  height: 88.h,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ColorManager.secondaryPrimary.withOpacity(0.3),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.cake,
                        color: ColorManager.primary,
                        size: 48.sp,
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Make your own cake!',
                              style: getBoldStyle(color: ColorManager.primary, fontSize: 20.sp),
                            ),
                            Text(
                              'No one can do it better than you',
                              style: getBoldStyle(color: ColorManager.black, fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h,),
            Text('Hope Collection' , style: getBoldStyle(color: ColorManager.black , fontSize: 24),),
            SizedBox(height: 16.h,),
            Expanded(
              flex: 1,
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 16.w,),
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) => ItemOfListview(),
              ),
            ),
            SizedBox(height: 16.h,),
            Text('Hope Collection' , style: getBoldStyle(color: ColorManager.black , fontSize: 24),),
            SizedBox(height: 16.h,),
            Expanded(
              flex: 1,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 16.w,),
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) => ItemOfListview(),
              ),
            ),

          ],
        ),
      ),
    );
  }

}
