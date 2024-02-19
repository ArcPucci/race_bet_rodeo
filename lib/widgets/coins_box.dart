import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';

class CoinsBox extends StatelessWidget {
  const CoinsBox({super.key, required this.coins, this.height});

  final int coins;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 91.w,
      height: height ?? 47.h,
      decoration: BoxDecoration(
        color: AppTheme.black2,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$coins',
            style: AppTextStyles.textStyle6,
          ),
          Image.asset(
            'assets/png/icons/coins.png',
            width: 29.r,
            height: 29.r,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
