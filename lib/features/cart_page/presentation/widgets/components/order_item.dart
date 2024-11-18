import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kharazah/core/utils/color_mananger.dart';
import 'package:kharazah/core/utils/styles_manager.dart';

class OrderItem extends StatelessWidget {
  final String shape;
  final String flavor;
  final String price;
  final String imagePath;
  final String color;
  final String toppings;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  const OrderItem({
    required this.shape,
    required this.flavor,
    required this.price,
    required this.imagePath,
    required this.color,
    required this.toppings,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.primary,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shape,
                    style: getMediumStyle(
                        color: ColorManager.white, fontSize: 16.sp),
                  ),
                  Text(
                    flavor,
                    style: getMediumStyle(
                        color: ColorManager.white.withOpacity(0.5),
                        fontSize: 11.sp),
                  ),
                  Text(
                    'Color: $color',
                    style: getMediumStyle(
                        color: ColorManager.white.withOpacity(0.5),
                        fontSize: 11.sp),
                  ),
                  Text(
                    'Toppings: $toppings',
                    style: getMediumStyle(
                        color: ColorManager.white.withOpacity(0.5),
                        fontSize: 11.sp),
                  ),
                  Text(
                    'SAR $price',
                    style: getMediumStyle(
                        color: ColorManager.white, fontSize: 16.sp),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.grey),
                  onPressed: onDecrement,
                ),
                Text(
                  '$quantity',
                  style: getMediumStyle(
                      color: ColorManager.white, fontSize: 12.sp),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: ColorManager.white),
                  onPressed: onIncrement,
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: ColorManager.red),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
