import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kharazah/config/routes/routes.dart';
import 'package:kharazah/core/components/custom_botton.dart';
import 'package:kharazah/core/utils/styles_manager.dart';
import '../../../../core/utils/color_mananger.dart';
import '../../../cart_page/presentation/pages/order_summary_page.dart';
import '../widgets/color_content.dart';
import '../widgets/pattern_content.dart';
import '../widgets/size.dart';
import '../widgets/styleContentWidget.dart';
import '../widgets/rubber_content.dart';
import '../widgets/write_page.dart';
import '../widgets/sole.dart';

class BakingPage extends StatefulWidget {
  static String routeName = 'bake_page';

  @override
  State<BakingPage> createState() => _BakingPageState();
}

class _BakingPageState extends State<BakingPage> {
  String selectedOption = '';
  bool isDetailVisible = false;

  String? selectedShoeImage;
  String? selectedShoePrice;
  String? selectedStyle;
  String? selectedPattern;
  String? selectedColor;
  //String? selectedRubber;
  String? selectedSole;
  String? selectedSize;
  String? selectedTabName;

  Widget _buildSelectedContent() {
    switch (selectedOption) {
      case 'Style':
        return StyleContent(onItemSelected: (selectedItem) {
          setState(() {
            selectedStyle = selectedItem['title'];
            selectedShoeImage = selectedItem['image'];
            selectedShoePrice = selectedItem['price'];
          });
        });
      case 'Pattern':
        return PatternContent(onItemSelected: (selectedItem) {
          setState(() {
            selectedPattern = selectedItem['title'];
            selectedShoeImage = selectedItem['image'];
          });
        });
      case 'Color':
        return ColorContent(onItemSelected: (selectedItem) {
          setState(() {
            selectedColor = selectedItem;
          });
        });
      case 'Size':
        return SizeContent(onItemSelected: (selectedItem) {
          setState(() {
            selectedSize = selectedItem;
          });
        });
      // case 'Rubber':
      //   return RubbersContent(onItemSelected: (selectedItem) {
      //     setState(() {
      //       selectedShoeImage = selectedItem['image'];
      //       selectedRubber =
      //           selectedItem['title']; // تخزين النكهة أو التوبينج
      //       selectedTabName = selectedItem['tab']; // تخزين اسم التاب
      //     });
      //   });
      case 'Sole':
        return SoleContent(onItemSelected: (selectedItem) {
          setState(() {
            selectedShoeImage = selectedItem['image'];
            selectedSole =
            selectedItem['title']; // تخزين النكهة أو التوبينج
            selectedTabName = selectedItem['tab']; // تخزين اسم التاب
          });
        });
      case 'Write':
        return WriteContent(onItemSelected: (p0) => true);
      default:
        return StyleContent(onItemSelected: (selectedItem) {
          setState(() {
            selectedStyle = selectedItem['title'];
            selectedShoeImage = selectedItem['image'];
            selectedShoePrice = selectedItem['price'];
          });
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Customize",
          style: getMediumStyle(color: ColorManager.primary, fontSize: 22.sp),
        ),

        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorManager.primary,
          ),
          onPressed: () {
            context.go(Routes.mainLayOut);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                if (selectedSize != null)
                  Text(
                    selectedSize ?? '',
                    style: getRegularStyle(
                        color: ColorManager.black, fontSize: 12.sp),
                  ),
                SizedBox(width: 10),
                if (selectedColor != null)
                  Text(
                    selectedColor ?? '',
                    style: getRegularStyle(
                        color: ColorManager.black, fontSize: 12.sp),
                  ),
                SizedBox(width: 10),
                Text(
                  selectedShoePrice ?? 'SAR 0',
                  style: getRegularStyle(
                      color: ColorManager.primary, fontSize: 12.sp),
                ),


              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 80,
            child: Image.asset(
              selectedShoeImage ?? 'assets/images2/product-0.png',
              width: MediaQuery.of(context).size.width,
              height: 200.h,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              width: 80.w,
              height: 420.h,
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      _buildMenuItem('assets/icons/Style.png', 'Style'),
                      _buildMenuItem('assets/icons/Pattern.png', 'Pattern'),
                      _buildMenuItem('assets/icons/Colors.png', 'Color'),
                     // _buildMenuItem('assets/icons/Rubber.png', 'Rubber'),
                      _buildMenuItem('assets/icons/Rubber.png', 'Sole'),
                      _buildMenuItem('assets/icons/size.png', 'Size'),
                      _buildMenuItem('assets/icons/Write.png', 'Write'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 100.w,
            right: 15.w,
            bottom: 80.h,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: AnimatedOpacity(
                opacity: isDetailVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 20),
                child: _buildSelectedContent(),
              ),
            ),
          ),
          Positioned(
              left: 90,
              right: 30,
              bottom: 2,
              child: CustomBotton(
                  text: 'Next',
                  color: ColorManager.primary,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderSummaryPage(
                          selectedStyle: selectedStyle,
                          selectedNaqsha: selectedPattern,
                          selectedColor: selectedColor,
                          selectedShoeImage: selectedShoeImage,
                          selectedShoePrice: selectedShoePrice,
                         // selectedRubber: selectedRubber,
                          selectedSole: selectedSole,
                          selectedSize: selectedSize,


                          //  onItemSelected: selectedTabName,
                        ),
                      ),
                    );
                  },
                  width: double.infinity)),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String imagePath, String label) {
    bool isSelected = selectedOption == label;
    return InkWell(
      onTap: () {
        setState(() {
          selectedOption = label; // تحديد الخيار المختار
          isDetailVisible = true; // عرض المحتوى المرتبط بالخيار
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorManager.secondaryColor.withOpacity(0.9)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: ColorManager.secondaryColor.withOpacity(0.6),
              blurRadius: 10,
              offset: Offset(0, 3), // تأثير لطيف
            ),
          ]
              : [],
        ),
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              width: 40,
              height: 40,
              fit: BoxFit.contain, // ضبط الصورة
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: getRegularStyle(color: Colors.white, fontSize: 10.sp),
            ),
          ],
        ),
      ),
    );
  }
}
