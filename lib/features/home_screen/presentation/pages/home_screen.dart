import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kharazah/core/utils/color_mananger.dart';
import 'package:kharazah/core/utils/styles_manager.dart';
import 'package:kharazah/config/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // إضافة المكتبة

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController =
      PageController();
  int _currentPage = 0; // لتتبع الصفحة الحالية

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildImageSlider(),
              SizedBox(height: 20.h),
              _buildProductDesignButton(context),
              SizedBox(height: 20.h),
              _buildImageWithText(),
              SizedBox(height: 20.h),
              _buildTwoImagesWithText(),
            ],
          ),
        ),
      ),
    );
  }

  // 1. AppBar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: ColorManager.white.withOpacity(0.5),
      toolbarHeight: 80.h,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          Text(
            'Delivery To',
            style: getBoldStyle(color: ColorManager.black, fontSize: 16.sp),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [

              Text(
                'Jeddah',
                style: getMediumStyle(
                    color: ColorManager.primary, fontSize: 14.sp),
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
        padding: EdgeInsets.all(3.w),
        child:

        Image(image: AssetImage('assets/images/icon.png'),),
      ),

    );
  }

  // 2. PageView for Image Slider
  Widget _buildImageSlider() {
    return Column(
      children: [
        Container(
          height: 220.h,
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index; // تحديث الصفحة الحالية عند التغيير
              });
            },
            children: [
              _buildSliderImage(ImageAssets.image1),
              _buildSliderImage(ImageAssets.image2),
              _buildSliderImage(ImageAssets.image3),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        _buildPageIndicator(), // النقاط تحت الـ PageView
      ],
    );
  }

  Widget _buildSliderImage(String imageAsset) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: Image.asset(
        imageAsset,
        fit: BoxFit.fill,
        width: double.infinity,
      ),
    );
  }

  // 3. Product Design Button
  Widget _buildProductDesignButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(Routes.bakingRoute);
      },
      child: Container(
        width: double.infinity,
        height: 180.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.image6),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: ColorManager.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12.r),
          ),

        ),
      ),
    );
  }

  // 4. Image with Text
  Widget _buildImageWithText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: Image.asset(
            ImageAssets.image7, // Your image here
            width: double.infinity,
            height: 150.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8.h),
        Center(
          child: Text(
            "أحذية أنيقة مصنوعة بكل حب!",
            style: getMediumStyle(color: ColorManager.black, fontSize: 14.sp),
          ),
        ),
      ],
    );
  }

  // 5. Two Images with Text
  Widget _buildTwoImagesWithText() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildImageContainer(ImageAssets.image5),
            _buildImageContainer(ImageAssets.image4),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          '"أحذيتنا المميزة"',
          style: getBoldStyle(color: ColorManager.black, fontSize: 16.sp),
        ),
      ],
    );
  }

  // Helper function for image container
  Widget _buildImageContainer(String imageAsset) {
    return Container(
      width: 160.w,
      height: 160.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageAsset),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
    );
  }

  // 6. Page Indicator (النقاط تحت الـ PageView)
  Widget _buildPageIndicator() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: SmoothPageIndicator(
        controller: _pageController, // ربط الـ controller
        count: 3, // عدد الصور في الـ PageView
        effect: WormEffect(
          dotColor: ColorManager.grey, // النقاط الغير نشطة
          activeDotColor: ColorManager.primary, // النقطة النشطة
        ),
      ),
    );
  }
}

class ImageAssets {
  static const String image1 = 'assets/images/modern.jpg';
  static const String image2 = 'assets/images/photo_5915986493401320064_x.jpg';
  static const String image3 = 'assets/images/differ.jpg';
  static const String  image4= 'assets/images/wo.jpg';
  static const String image6 = 'assets/images2/do.jpg';
  static const String image5 = 'assets/images/ki.jpg';
  static const String image7 = 'assets/images2/free.jpg';

}
