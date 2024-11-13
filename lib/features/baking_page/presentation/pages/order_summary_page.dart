import 'package:flutter/material.dart';

class OrderSummaryPage extends StatelessWidget {
  final String? selectedShape;
  final String? selectedFlavor;
  final String? selectedColor;
  final String? selectedCakeImage;
  final String? selectedCakePrice;
  final String? selectedToppings;

  const OrderSummaryPage({
    Key? key,
    this.selectedShape,
    this.selectedFlavor,
    this.selectedColor,
    this.selectedCakeImage,
    this.selectedCakePrice,
    this.selectedToppings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Shape: $selectedShape'),
            Text('Flavor: $selectedFlavor'),
            Text('Color: $selectedColor'),
            if (selectedCakeImage != null) Image.asset(selectedCakeImage!),
            Text('Price: $selectedCakePrice'),
            if (selectedToppings != null && selectedToppings!.isNotEmpty)
              Text('Toppings/Message: $selectedToppings'),
          ],
        ),
      ),
    );
  }
}
