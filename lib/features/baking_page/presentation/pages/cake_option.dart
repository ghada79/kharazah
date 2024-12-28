import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/color_mananger.dart';
import '../../../../core/utils/styles_manager.dart';

class ShoeOption extends StatefulWidget {
  final Image image;
  final String title;
  final String price;
  final String description;
  final bool isSelected;  // إضافة خاصية isSelected

  const ShoeOption({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.isSelected,
    required this.description
    // تمرير isSelected
  });

  @override
  State<ShoeOption> createState() => _CakeOptionState();
}

class _CakeOptionState extends State<ShoeOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.isSelected ? ColorManager.secondaryColor.withOpacity(0.4) : Colors.transparent, // تغيير اللون إذا كان محدد
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.image,
          const SizedBox(height: 8),
          Center(
            child: Text(

              widget.title,
              style: getBoldStyle(color: ColorManager.secondaryColor, fontSize: 11.sp , ), // تغيير النص للون الأبيض عندما يكون المحدد
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              widget.description,
              style: getMediumStyle(color: ColorManager.secondaryColor, fontSize: 8.sp,), // تغيير النص للون الأبيض عندما يكون المحدد
            ),
          ),
          Center(
            child: Text(
              widget.price,
              style: getMediumStyle(color: ColorManager.secondaryColor, fontSize: 9.sp), // تغيير النص للون الأبيض عندما يكون المحدد
            ),
          ),

        ],
      ),
    );
  }
}
