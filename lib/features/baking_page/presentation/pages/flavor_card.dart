import 'package:flutter/material.dart';

class FlavorCard extends StatelessWidget {
  final String flavor;
  final String image;
  final VoidCallback onTap;

  const FlavorCard(
      {required this.flavor, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 40, width: 50, fit: BoxFit.cover),
            SizedBox(height: 8),
            Text(flavor),
          ],
        ),
      ),
    );
  }
}
