import 'package:flutter/material.dart';

import '../pages/cake_option.dart';

class ShapeContent extends StatelessWidget {
  final Function(Map<String, dynamic>) onItemSelected;

  const ShapeContent({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cakes = [
      {
        'title': 'Mini Standard',
        'price': '190 SAR',
        'image': 'assets/images/images.jpg'
      },
      {
        'title': 'Mini Heart',
        'price': '220 SAR',
        'image': 'assets/images/images.jpg'
      },
      {
        'title': 'Standard Cake',
        'price': '240 SAR',
        'image': 'assets/images/images.jpg'
      },
      {
        'title': 'Heart Cake',
        'price': '230 SAR',
        'image': 'assets/images/images.jpg'
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: cakes.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            onItemSelected(cakes[index]);
          },
          child: CakeOption(
            title: cakes[index]['title'] ?? '',
            price: cakes[index]['price'] ?? '',
            image: Image.asset(cakes[index]['image']),
          ),
        );
      },
    );
  }
}
