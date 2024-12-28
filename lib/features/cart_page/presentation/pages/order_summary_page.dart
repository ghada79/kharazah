import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kharazah/core/components/custom_botton.dart';
import 'package:kharazah/core/utils/color_mananger.dart';
import 'package:kharazah/core/utils/styles_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderSummaryPage extends StatefulWidget {
  final String? selectedStyle;
  final String? selectedNaqsha;
  final String? selectedColor;
  final String? selectedShoeImage;
  final String? selectedShoePrice;
  //final String? selectedRubber;
   final String? selectedSole;
  final String? selectedSize;

  const OrderSummaryPage({
    required this.selectedStyle,
    required this.selectedNaqsha,
    required this.selectedColor,
    required this.selectedShoeImage,
    required this.selectedShoePrice,
    //required this.selectedRubber,
    required this.selectedSole,
    required this.selectedSize
  });

  @override
  _OrderSummaryPageState createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  int _quantity = 1;

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  void incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  int _getParsedPrice() {
    final cleanedPrice =
        widget.selectedShoePrice?.replaceAll(RegExp(r'[^0-9]'), '') ?? '0';
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_quantity > 0) _buildProductDetails(),
                SizedBox(height: 20),
                _buildTextField('Delivery Address', _addressController,
                    TextInputType.streetAddress),
                SizedBox(height: 20),
                _buildTextField(
                    'Phone Number', _phoneController, TextInputType.phone),
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
                    onTap: _placeOrder,
                    width: double.infinity,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, TextInputType inputType) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.secondaryColor,
        labelText: label,
        labelStyle:
            getMediumStyle(color: ColorManager.primary, fontSize: 14.sp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorManager.white),
        ),
      ),
      style: TextStyle(color: ColorManager.white),
    );
  }

  Widget _buildProductDetails() {
    return Card(
      color: ColorManager.primary,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Image.asset(
              widget.selectedShoeImage ?? 'assets/images/default.jpg',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.selectedStyle ?? 'Default Style',
                      style: getMediumStyle(
                          color: ColorManager.white, fontSize: 16.sp)),
                  Text('Color: ${widget.selectedColor ?? 'Default'}',
                      style: getMediumStyle(
                          color: ColorManager.white.withOpacity(0.5),
                          fontSize: 11.sp)),
                  Text('Size: ${widget.selectedSize ?? 'Default'}',
                      style: getMediumStyle(
                          color: ColorManager.white.withOpacity(0.5),
                          fontSize: 11.sp)),
                  Text('SAR ${widget.selectedShoePrice ?? '0'}',
                      style: getMediumStyle(
                          color: ColorManager.white, fontSize: 16.sp)),
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _placeOrder() async {
    final phone = _phoneController.text.trim();
    final address = _addressController.text.trim();

    if (phone.isEmpty || address.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields.')),
      );
      return;
    }

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'Hesham@kharazah.net',
      query: Uri.encodeFull(
        'subject=New Shoes Order&body=Order Details:\n'
            'Style: ${widget.selectedStyle ?? 'N/A'}\n'
            'Naqsha: ${widget.selectedNaqsha ?? 'N/A'}\n'
            'Color: ${widget.selectedColor ?? 'N/A'}\n'
            'Size: ${widget.selectedSize ?? 'N/A'}\n'
            'Shoe Price: ${widget.selectedShoePrice ?? '0'}\n'
           // 'Rubber: ${widget.selectedRubber ?? 'N/A'}\n'
            'Quantity: $_quantity\n'
            'Total Price: SAR ${_getParsedPrice() * _quantity}\n'
            'Delivery Address: $address\n'
            'Phone: $phone',
      ),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
      print('Order Placed!');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not send email.')),
      );
    }
  }
}
