import 'package:flutter/material.dart';

class OrderSummaryPage extends StatelessWidget {
  final String? selectedShape;
  final String? selectedFlavor;
  final String? selectedColor;
  final String? selectedCakeImage;
  final String? selectedCakePrice;
  final String? selectedToppings;
  final String? onItemSelected;

  const OrderSummaryPage({required this.selectedShape,
      required this.selectedFlavor,
      required this.selectedColor,
      required this.selectedCakeImage,
      required this.selectedCakePrice,
      required this.selectedToppings,
      required this.onItemSelected});

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
            Text('Selected Shape: $selectedShape'),
            Text('Selected Flavor: $selectedFlavor'),
            Text('Selected Color: $selectedColor'),
            Text('Selected Toppings: $selectedToppings'),
            Text('Selected TabName: $onItemSelected '),
            SizedBox(height: 20),
            Image.asset(
              selectedCakeImage ?? 'assets/images/default.jpg',
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Total Price: $selectedCakePrice',
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
}
