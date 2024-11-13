import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/color_mananger.dart';
import '../../../../core/utils/styles_manager.dart';
import '../manager/main_layout_cubit.dart';

class MainLayOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainLayoutCubit, MainLayoutState>(
        builder: (context, state) {
          final mainLayoutCubit = context.read<MainLayoutCubit>();
          return mainLayoutCubit.screens[mainLayoutCubit.currentIndex];
        },
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.r),
        ),
        child: BottomNavigationBar(
          backgroundColor: ColorManager.primary,
          type: BottomNavigationBarType.fixed,
          currentIndex: context.watch<MainLayoutCubit>().currentIndex,
          onTap: (index) {
            context.read<MainLayoutCubit>().changeIndex(index);
          },
          selectedLabelStyle:
          getMediumStyle(color: ColorManager.white, fontSize: 12.sp),
          unselectedLabelStyle:
          getBoldStyle(color: ColorManager.white, fontSize: 10.sp),
          selectedItemColor: ColorManager.white,
          unselectedItemColor: ColorManager.white,
          selectedIconTheme: IconThemeData(
            color: ColorManager.white,
            size: 24.sp,
          ),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
