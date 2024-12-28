import 'package:flutter/material.dart';

class SizeContent extends StatelessWidget {
  final Function(String) onItemSelected;

  const SizeContent({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    List<String> sizes = [
        '39', '40', '41', '42', '43', '44', '45','46'
    ];

    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عدد الأعمدة
        childAspectRatio: 1.5, // النسبة لجعل المستطيلات أصغر
        crossAxisSpacing: 8, // المسافة بين الأعمدة
        mainAxisSpacing: 8, // المسافة بين الصفوف
      ),
      itemCount: sizes.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            onItemSelected(sizes[index]);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60, // العرض
                height: 60, // الارتفاع
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle, // مستطيل
                  color: Colors.white, // لون الخلفية
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black, // لون الإطار
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    sizes[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
