import 'package:flutter/material.dart';
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
        title: Text("Customize"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                if (selectedColor != null)
                  Text(
                    selectedColor ?? '',
                    style: TextStyle(
                      color: Colors.purple[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                SizedBox(width: 10),
                Text(
                  selectedCakePrice ?? 'SAR 0',
                  style: TextStyle(color: Colors.purple[400]),
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
              width: 80,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.purple[400],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
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
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: AnimatedOpacity(
                opacity: isDetailVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 300),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 5),
                    ],
                  ),
                  child: _buildSelectedContent(),
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: ElevatedButton(
              onPressed: () {
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
                      onItemSelected: selectedTabName, // تمرير اسم التاب
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[400],
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
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
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple[300] : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 25),
            SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
