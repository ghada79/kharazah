import 'package:flutter/material.dart';

class ColorContent extends StatelessWidget {
  final Function(String) onItemSelected;

  const ColorContent({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    List<String> colors = ['Red', 'Blue', 'Green', 'Yellow', 'Pink', 'Purple'];

    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            onItemSelected(colors[index]);
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // تغيير الشكل إلى دائري
              color: _getColor(colors[index]),
            ),
            alignment: Alignment.center,
            child: Text(
              colors[index],
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getColor(String color) {
    switch (color) {
      case 'Red':
        return Colors.red;
      case 'Blue':
        return Colors.blue;
      case 'Green':
        return Colors.green;
      case 'Yellow':
        return Colors.yellow;
      case 'Pink':
        return Colors.pink;
      case 'Purple':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}
