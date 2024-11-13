import 'package:flutter/material.dart';

class FlavorContent extends StatefulWidget {
  final Function(Map<String, dynamic>) onItemSelected;

  const FlavorContent({required this.onItemSelected});

  @override
  _FlavorContentState createState() => _FlavorContentState();
}

class _FlavorContentState extends State<FlavorContent> {
  String? selectedFlavor;
  String? selectedCakeImage;

  @override
  Widget build(BuildContext context) {
    List<String> flavors = [
      'Vanilla',
      'Chocolate',
      'Red Velvet',
      'Strawberry',
      'Caramel',
      'Coffee'
    ];
    List<String> flavorImages = [
      'assets/images/cake.jpg',
      'assets/images/cake.jpg',
      'assets/images/istockphoto.jpg',
      'assets/images/cake.jpg',
      'assets/images/cake.jpg',
      'assets/images/istockphoto.jpg'
    ];

    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: flavors.length, // عدلناها علشان تكون على طول بتاخد طول list
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedFlavor = flavors[index];
              selectedCakeImage = flavorImages[index];
            });
            widget.onItemSelected({
              'title': selectedFlavor,
              'image': selectedCakeImage,
            });
          },
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  flavorImages[index],
                  height: 40,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8),
                Text(flavors[index]),
              ],
            ),
          ),
        );
      },
    );
  }
}
