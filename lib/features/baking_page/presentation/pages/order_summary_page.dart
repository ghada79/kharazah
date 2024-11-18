import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kharazah/core/components/custom_botton.dart';
import 'package:kharazah/core/utils/color_mananger.dart';
import 'package:kharazah/core/utils/styles_manager.dart';

class OrderSummaryPage extends StatefulWidget {
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
  _OrderSummaryPageState createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  int _quantity = 1;

  // Function to increment the quantity
  void incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  // Function to decrement the quantity
  void decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  // Function to delete the item
  void deleteItem() {
    setState(() {
      _quantity = 0;
    });
  }

  int _getParsedPrice() {
    // Remove any non-numeric characters from the price string
    final cleanedPrice = widget.selectedCakePrice?.replaceAll(RegExp(r'[^0-9]'), '') ?? '0';
    return int.parse(cleanedPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Summary',
          style: getMediumStyle(color: ColorManager.white, fontSize: 16.sp),
        ),
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
            if (_quantity > 0)
              _buildProductItem(
                context,
                widget.selectedShape ?? 'Default Shape',
                widget.selectedFlavor ?? 'Default Flavor',
                widget.selectedCakePrice ?? '0',
                widget.selectedCakeImage ?? 'assets/images/default.jpg',
                widget.selectedColor ?? 'Default Color',
                widget.selectedToppings ?? 'No Toppings',
              ),
            SizedBox(height: 20),
            if (_quantity > 0)
              Text(
                'Total Price: SAR ${_getParsedPrice() * _quantity}', // اجمالي السعر
                style: getMediumStyle(color: ColorManager.black, fontSize: 16.sp),
              ),
            if (_quantity > 0)
              SizedBox(height: 20),
            if (_quantity > 0)
              CustomBotton(
                text: 'Place Order',
                color: ColorManager.primary,
                onTap: () {},
                width: double.infinity,
              ),
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
                  onPressed: decrementQuantity, // Call to decrement quantity
                ),
                Text(
                  '$_quantity', // Display the current quantity
                  style: getMediumStyle(color: ColorManager.white, fontSize: 12.sp),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: ColorManager.white),
                  onPressed: incrementQuantity, // Call to increment quantity
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: ColorManager.red),
                  onPressed: deleteItem, // Call to delete item
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
