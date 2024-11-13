import 'package:flutter/material.dart';

import 'cake_option.dart';
import 'constants.dart';
import 'flavor_card.dart';
import 'order_summary_page.dart';

class BakingPage extends StatefulWidget {
  static String routeName = 'bake_page';

  @override
  State<BakingPage> createState() => _BakingPageState();
}

class _BakingPageState extends State<BakingPage> {
  String selectedOption = '';
  String? selectedShape,
      selectedFlavor,
      selectedColor,
      selectedCakeImage,
      selectedCakePrice,
      selectedToppings;

  Widget _buildShapeContent() => GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.75),
      itemCount: cakes.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => setState(() {
            selectedShape = cakes[index]['title'];
            selectedCakeImage = cakes[index]['image'];
            selectedCakePrice = cakes[index]['price'];
          }),
          child: CakeOption(
            title: cakes[index]['title'] ?? '',
            price: cakes[index]['price'] ?? '',
            image: Image.asset(cakes[index]['image']),
          ),
        );
      });

  Widget _buildFlavorContent() => GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1.5),
      itemCount: flavors.length,
      itemBuilder: (context, index) {
        return FlavorCard(
          flavor: flavors[index],
          image: flavorImages[index],
          onTap: () => setState(() => selectedFlavor = flavors[index]),
        );
      });

  Widget _buildSelectedContent() {
    switch (selectedOption) {
      case 'Shape':
        return _buildShapeContent();
      case 'Flavor':
        return _buildFlavorContent();
      default:
        return _buildShapeContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Customize")),
      body: Column(
        children: [
          Expanded(child: _buildSelectedContent()),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderSummaryPage(
                  selectedShape: selectedShape,
                  selectedFlavor: selectedFlavor,
                  selectedColor: selectedColor,
                  selectedCakeImage: selectedCakeImage,
                  selectedCakePrice: selectedCakePrice,
                  selectedToppings: selectedToppings,
                ),
              ),
            ),
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
