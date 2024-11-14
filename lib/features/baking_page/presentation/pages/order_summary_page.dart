import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kharazah/core/components/custom_botton.dart';
import 'package:kharazah/core/utils/color_mananger.dart';
import 'package:kharazah/core/utils/styles_manager.dart';

class OrderSummaryPage extends StatelessWidget {
  final String? selectedShape;
  final String? selectedFlavor;
  final String? selectedColor;
  final String? selectedCakeImage;
  final String? selectedCakePrice;
  final String? selectedToppings;
  final String? onItemSelected;

  const OrderSummaryPage({
    required this.selectedShape,
    required this.selectedFlavor,
    required this.selectedColor,
    required this.selectedCakeImage,
    required this.selectedCakePrice,
    required this.selectedToppings,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Summary' , style: getMediumStyle(color: ColorManager.white, fontSize: 16.sp),),
        centerTitle: true,
        backgroundColor: ColorManager.primary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorManager.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 88.h,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductItem(
              context,
              selectedShape ?? 'Default Shape',
              selectedFlavor ?? 'Default Flavor',
              selectedCakePrice ?? '0',
              selectedCakeImage ?? 'assets/images/default.jpg',
              // صورة المنتج
              selectedColor ?? 'Default Color',
              selectedToppings ?? 'No Toppings',
            ),
            SizedBox(height: 20),
            Text(
              'Total Price: SAR ${selectedCakePrice ?? '490'}', // اجمالي السعر
              style: getMediumStyle(color: ColorManager.black, fontSize: 16.sp),
            ),
            SizedBox(height: 20),
            CustomBotton(text: 'Place Order', color: ColorManager.primary, onTap: (){}, width: double.infinity,),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem(
    BuildContext context,
    String shape,
    String flavor,
    String price,
    String imagePath,
    String color,
    String toppings,
  ) {
    return Card(
      color: ColorManager.primary,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shape, // الشكل المختار
                    style: getMediumStyle(color: ColorManager.white, fontSize: 16.sp),
                  ),
                  Text(
                    flavor, // النكهة المختارة
                    style: getMediumStyle(color: ColorManager.white.withOpacity(0.5), fontSize: 11.sp),
                  ),
                  Text(
                    'Color: $color', // اللون المختار
                    style: getMediumStyle(color: ColorManager.white.withOpacity(0.5), fontSize: 11.sp),
                  ),
                  Text(
                    'Toppings: $toppings', // الإضافات المختارة
                    style: getMediumStyle(color: ColorManager.white.withOpacity(0.5), fontSize: 11.sp),
                  ),
                  Text(
                    'SAR $price', // السعر
                    style: getMediumStyle(color: ColorManager.white, fontSize: 16.sp),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.grey),
                  onPressed: () {
                    // تقليل العدد
                  },
                ),
                Text('1' , style: getMediumStyle(color: ColorManager.white, fontSize: 12.sp)), // العرض الافتراضي للعدد
                IconButton(
                  icon: Icon(Icons.add, color: ColorManager.white),
                  onPressed: () {
                    // زيادة العدد
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: ColorManager.red),
                  onPressed: () {
                    // مسح المنتج
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
