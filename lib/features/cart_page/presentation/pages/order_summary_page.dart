import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kharazah/core/components/custom_botton.dart'; // تأكد من استيراد CustomBotton
import 'package:kharazah/core/utils/color_mananger.dart'; // استيراد ColorManager إذا لم يكن مستورداً
import 'package:kharazah/core/utils/styles_manager.dart'; // استيراد styles_manager إذا لم يكن مستورداً

import '../widgets/email_service.dart';

class OrderSummaryPage extends StatefulWidget {
  // تعريف المتغيرات التي سيتم عرضها في صفحة OrderSummaryPage
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

  // Text Editing Controllers
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

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
    final cleanedPrice =
        widget.selectedCakePrice?.replaceAll(RegExp(r'[^0-9]'), '') ?? '0';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
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
                TextField(
                  controller: _addressController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    filled: true,
                    // لتفعيل لون الخلفية
                    fillColor: ColorManager.secondaryColor,
                    // اللون المراد استخدامه للخلفية
                    labelText: 'Delivery Address',
                    labelStyle: getMediumStyle(
                        color: ColorManager.primary, fontSize: 14.sp),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(8), // تعديل الزوايا إذا لزم
                      borderSide:
                          BorderSide(color: ColorManager.white), // لون الحواف
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: ColorManager
                              .white), // لون الحواف عندما يكون الحقل غير مفعّل
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: ColorManager.white,
                          width: 2), // لون الحواف عندما يكون الحقل مفعّل
                    ),
                  ),
                  style: TextStyle(
                      color: ColorManager.white), // لون النص داخل الحقل
                ),
                TextField(
                  controller:
                      _phoneController, // ربط TextField بـ _phoneController
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorManager.secondaryColor,
                    labelText: 'Phone Number',
                    labelStyle: getMediumStyle(
                        color: ColorManager.primary, fontSize: 14.sp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: ColorManager.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: ColorManager.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: ColorManager.white, width: 2),
                    ),
                  ),
                  style: TextStyle(color: ColorManager.white),
                ),
                SizedBox(height: 20),
                if (_quantity > 0)
                  Text(
                    'Total Price: SAR ${_getParsedPrice() * _quantity}',
                    style: getMediumStyle(
                        color: ColorManager.white, fontSize: 16.sp),
                  ),
                SizedBox(height: 20),
                if (_quantity > 0)
                  CustomBotton(
                    text: 'Place Order',
                    color: ColorManager.primary,
                    onTap: () {
                      final phone = _phoneController.text
                          .trim(); // تأكد من أخذ النص من الـ phoneController
                      final address = _addressController.text
                          .trim(); // تأكد من أخذ النص من الـ addressController

                      if (phone.isEmpty || address.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please fill all fields.')),
                        );
                        return;
                      }

                      final cakeDetails =
                          widget.selectedShape ?? 'Unknown Shape';
                      final totalPrice = _getParsedPrice() * _quantity;

                      final orderDetails = '''
                           Order Details:
                           Cake Shape: $cakeDetails
                           Quantity: $_quantity
                           Total Price: SAR $totalPrice
                           Delivery Address: $address
                           Phone: $phone
                                 ''';

                      // إرسال تفاصيل الطلب عبر البريد الإلكتروني
                      sendOrderEmail('ghadaragab1717@gmail.com', orderDetails);

                      // عمل عملية إرسال الطلب
                      print('Order Placed!');
                      print('Phone: $phone');
                      print('Address: $address');
                    },
                    width: double.infinity,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // أكواد بناء تفاصيل المنتج (الكود الذي ذكرته من قبل)
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
                    shape,
                    style: getMediumStyle(
                        color: ColorManager.white, fontSize: 16.sp),
                  ),
                  Text(
                    flavor,
                    style: getMediumStyle(
                        color: ColorManager.white.withOpacity(0.5),
                        fontSize: 11.sp),
                  ),
                  Text(
                    'Color: $color',
                    style: getMediumStyle(
                        color: ColorManager.white.withOpacity(0.5),
                        fontSize: 11.sp),
                  ),
                  Text(
                    'Toppings: $toppings',
                    style: getMediumStyle(
                        color: ColorManager.white.withOpacity(0.5),
                        fontSize: 11.sp),
                  ),
                  Text(
                    'SAR $price',
                    style: getMediumStyle(
                        color: ColorManager.white, fontSize: 16.sp),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.grey),
                  onPressed: decrementQuantity,
                ),
                Text(
                  '$_quantity',
                  style: getMediumStyle(
                      color: ColorManager.white, fontSize: 12.sp),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: ColorManager.white),
                  onPressed: incrementQuantity,
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: ColorManager.red),
                  onPressed: deleteItem,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
