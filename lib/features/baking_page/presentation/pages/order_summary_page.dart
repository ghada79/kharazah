import 'package:flutter/material.dart';

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
        title: Text('Order Summary'),
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
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // يمكنك إضافة وظيفة إتمام الطلب هنا
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Place Order'),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    flavor, // النكهة المختارة
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Color: $color', // اللون المختار
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Toppings: $toppings', // الإضافات المختارة
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'SAR $price', // السعر
                    style: TextStyle(color: Colors.purple[400]),
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
                Text('1'), // العرض الافتراضي للعدد
                IconButton(
                  icon: Icon(Icons.add, color: Colors.purple),
                  onPressed: () {
                    // زيادة العدد
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
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
