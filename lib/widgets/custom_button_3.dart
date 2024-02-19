import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';

class CustomButton3 extends StatelessWidget {
  const CustomButton3({
    super.key,
    this.onTap,
    this.width,
    this.height,
    required this.coins,
  });

  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final int coins;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 254.w,
        height: height ?? 39.h,
        decoration: BoxDecoration(
          color: AppTheme.yellow,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BUY $coins', style: AppTextStyles.textStyle10),
            SizedBox(width: 5.w),
            Image.asset(
              'assets/png/icons/coins.png',
              width: 20.r,
              height: 20.r,
              color: Colors.black,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
