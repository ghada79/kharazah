import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kharazah/config/routes/routes.dart';
import 'package:kharazah/core/components/custom_botton.dart';
import 'package:kharazah/core/utils/color_mananger.dart';
import 'package:kharazah/core/utils/styles_manager.dart';
import '../widgets/color_content.dart';
import '../widgets/flavor_content.dart';
import '../widgets/shapeContentWidget.dart';
import '../widgets/toppings_content.dart';
import '../widgets/toppings_page.dart';
import 'order_summary_page.dart'; // صفحة الملخص

class BakingPage extends StatefulWidget {
  static String routeName = 'bake_page';

  @override
  State<BakingPage> createState() => _BakingPageState();
}

class _BakingPageState extends State<BakingPage> {
  String selectedOption = '';
  bool isDetailVisible = false;

  String? selectedCakeImage;
  String? selectedCakePrice;
  String? selectedShape;
  String? selectedFlavor;
  String? selectedColor;
  String? selectedToppings;
  String? selectedTabName;

  Widget _buildSelectedContent() {
    switch (selectedOption) {
      case 'Shape':
        return ShapeContent(onItemSelected: (selectedItem) {
          setState(() {
            selectedShape = selectedItem['title'];
            selectedCakeImage = selectedItem['image'];
            selectedCakePrice = selectedItem['price'];
          });
        });
      case 'Flavor':
        return FlavorContent(onItemSelected: (selectedItem) {
          setState(() {
            selectedFlavor = selectedItem['title'];
            selectedCakeImage = selectedItem['image'];
          });
        });
      case 'Color':
        return ColorContent(onItemSelected: (selectedItem) {
          setState(() {
            selectedColor = selectedItem;
          });
        });
      case 'Toppings':
        return ToppingsContent(onItemSelected: (selectedItem) {
          setState(() {
            selectedCakeImage = selectedItem['image'];
            selectedToppings =
                selectedItem['title']; // تخزين النكهة أو التوبينج
            selectedTabName = selectedItem['tab']; // تخزين اسم التاب
          });
        });
      case 'Write':
        return ToppingsWriteContent(onItemSelected: (p0) => true);
      default:
        return ShapeContent(onItemSelected: (selectedItem) {
          setState(() {
            selectedShape = selectedItem['title'];
            selectedCakeImage = selectedItem['image'];
            selectedCakePrice = selectedItem['price'];
          });
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customize" , style: getMediumStyle(color: ColorManager.white, fontSize: 16.sp),),
        centerTitle: true,
        backgroundColor: ColorManager.primary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorManager.white,
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
                if (selectedColor != null)
                  Text(
                    selectedColor ?? '',
                    style: getRegularStyle(color: ColorManager.white, fontSize: 12.sp),
                  ),
                SizedBox(width: 10),
                Text(
                  selectedCakePrice ?? 'SAR 0',
                  style: getRegularStyle(color: ColorManager.white, fontSize: 12.sp),
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
              selectedCakeImage ?? '',
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 80,
            child: Container(
              width: 80.w,
              height: 320.h,
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
                      _buildMenuItem(Icons.cake, 'Shape'),
                      _buildMenuItem(Icons.restaurant, 'Flavor'),
                      _buildMenuItem(Icons.palette, 'Color'),
                      _buildMenuItem(Icons.fastfood, 'Toppings'),
                      _buildMenuItem(Icons.fastfood, 'Write'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 100,
            right: 16,
            bottom: 80,
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
            left: 16,
            right: 16,
            bottom: 16,
            child: CustomBotton(text: 'Next', color: ColorManager.primary, onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderSummaryPage(
                    selectedShape: selectedShape,
                    selectedFlavor: selectedFlavor,
                    selectedColor: selectedColor,
                    selectedCakeImage: selectedCakeImage,
                    selectedCakePrice: selectedCakePrice,
                    selectedToppings: selectedToppings,
                    onItemSelected: selectedTabName,
                  ),
                ),
              );
            }, width: double.infinity)
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    bool isSelected = selectedOption == label;
    return InkWell(
      onTap: () {
        setState(() {
          selectedOption = label;
          isDetailVisible = true;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 8 , horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? ColorManager.secondaryPrimary.withOpacity(0.4) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 25),
            SizedBox(height: 2),
            Text(
              label,
              style: getRegularStyle(color: ColorManager.white, fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
