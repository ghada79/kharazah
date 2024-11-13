import 'dart:ui';

import 'package:flutter/material.dart';

class CakeOption extends StatefulWidget {
  final Image image;
  final String title;
  final String price;

  const CakeOption({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  State<CakeOption> createState() => _CakeOptionState();
}

class _CakeOptionState extends State<CakeOption> {
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
          widget.image,
          const SizedBox(height: 5),
          Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            widget.price,
            style: TextStyle(
              color: Colors.purple[400],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
