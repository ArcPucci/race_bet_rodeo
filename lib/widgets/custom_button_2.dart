import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({
    super.key,
    required this.asset,
    required this.text,
    this.onTap,
  });

  final String asset;
  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 331.w,
        height: 50.h,
        decoration: BoxDecoration(
          gradient: AppTheme.gradient2,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        child: Row(
          children: [
            Image.asset(
              asset,
              width: 24.sp,
              height: 24.sp,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8.w),
            Text(text, style: AppTextStyles.textStyle12),
          ],
        ),
      ),
    );
  }
}
