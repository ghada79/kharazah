
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kharazah/core/utils/color_mananger.dart';
import 'package:kharazah/core/utils/styles_manager.dart';

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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorManager.secondaryPrimary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.image,
          const SizedBox(height: 8),
          Text(
            widget.title,
            style: getMediumStyle(color: ColorManager.black, fontSize: 14.sp),
          ),
          const SizedBox(height: 8),
          Text(
            widget.price,
            style: getMediumStyle(color: ColorManager.primary, fontSize: 11.sp),
          ),
        ],
      ),
    );
  }
}
