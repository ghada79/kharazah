import 'package:flutter/material.dart';

class ColorContent extends StatelessWidget {
  final Function(String) onItemSelected;

  const ColorContent({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    List<String> colors = [
      'Red', 'Blue', 'Green', 'Yellow', 'Camel', 'Beige',
      'Orange', 'Gray', 'White', 'Brown', 'Black', 'Maroon'
    ];
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عدد الأعمدة
        childAspectRatio: 1.5, // تقليل النسبة لجعل المستطيلات أصغر
        crossAxisSpacing: 8, // تقليل المسافة بين الأعمدة
        mainAxisSpacing: 8, // تقليل المسافة بين الصفوف
      ),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            onItemSelected(colors[index]);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50, // تقليل العرض
                height: 50, // تقليل الارتفاع
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle, // جعلها مستطيلة
                  color: _getColor(colors[index]),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              SizedBox(height: 8), // المسافة بين المستطيل والنص
              Text(
                colors[index],
                style: TextStyle(
                  color: Colors.black, // تغيير لون النص
                  fontSize: 12, // تقليل حجم الخط
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Color _getColor(String color) {
    switch (color) {
      case 'Red':
        return Color(0xffdf0024);
      case 'Blue':
        return Color(0xff0669b2);
      case 'Green':
        return Color(0xff007520);
      case 'Yellow':
        return Color(0xffeae606);
      case 'Camel':
        return Color(0xffe2984f);
      case 'Beige':
        return Color(0xffede8d0);
      case 'Orange':
        return Color(0xffe8641b);
      case 'Maroon':
        return Color(0xff550000);
      case 'Black':
        return Color(0xff000000);
      case 'White':
        return Color(0xffffffff);
      case 'Gray':
        return Color(0xffa8a8a8);
      case 'Brown':
        return Color(0xff895129);
      default:
        return Colors.grey;
    }
  }
}
