import 'package:flutter/material.dart';

class ToppingsWriteContent extends StatelessWidget {
  final Function(String) onItemSelected;

  const ToppingsWriteContent({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: (value) {
          onItemSelected(value); // عند الكتابة في الـ TextField، هنمرر القيمة
        },
        decoration: InputDecoration(
          labelText: 'Add Toppings/Message',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
