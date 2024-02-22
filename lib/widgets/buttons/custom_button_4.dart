import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';

class CustomButton4 extends StatelessWidget {
  const CustomButton4({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 38.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            width: 1.sp,
            color: Colors.black,
          ),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 11.w),
        child: Row(
          children: [
            Text(
              'Randomize',
              style: AppTextStyles.textStyle10.copyWith(
                fontWeight: FontWeight.w500,
                letterSpacing: -0.24,
              ),
            ),
            SizedBox(width: 5.w),
            Image.asset(
              'assets/png/icons/reload.png',
              width: 18.r,
              height: 18.r,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
