import 'package:flutter/material.dart';

class CakeOption extends StatelessWidget {
  final Image image;
  final String title;
  final String price;

  const CakeOption({
    Key? key,
    required this.title,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image,
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            price,
            style: TextStyle(
                color: Colors.purple[400], fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
