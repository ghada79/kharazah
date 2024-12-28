import 'package:flutter/material.dart';

import '../pages/cake_option.dart';

class StyleContent extends StatefulWidget {
  final Function(Map<String, dynamic>) onItemSelected;

  const StyleContent({required this.onItemSelected});

  @override
  _ShapeContentState createState() => _ShapeContentState();
}

class _ShapeContentState extends State<StyleContent> {
  String? selectedStyle;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> shoes = [
      {
        'title': 'Saudi',
        'description': 'good nice',
        'price': '190 SAR',
        'image': 'assets/style/Saudi.png'

      },
      {
        'title': 'Khaligy',
        'price': '220 SAR',
        'image': 'assets/style/Khaligy.png',
        'description': 'aaaaaaaaaaaaaaaa'
      },
      {
        'title': 'Omani',
        'price': '240 SAR',
        'image': 'assets/style/Omani.png',
        'description': 'aaaaaaaaaaaaaaaa'
      },


    ];

    return GridView.builder(

      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio:0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: shoes.length,
      itemBuilder: (context, index) {
        final shoe = shoes[index];
        final isSelected = selectedStyle == shoe['title'];
        return InkWell(
          onTap: () {
            setState(() {
              selectedStyle = shoe['title']; // تحديث الشكل المحدد
            });
            widget.onItemSelected(shoe); // تحديث القيمة في الشكل الرئيسي
          },
          child: ShoeOption(
            title: shoe['title'],
            price: shoe['price'],
            description: shoe['description'],
            image: Image.asset(shoe['image']), isSelected:isSelected,
          ),
        );
      },
    );
  }
}
