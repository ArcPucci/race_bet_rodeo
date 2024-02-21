import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class EverydayGiftDialog extends StatelessWidget {
  const EverydayGiftDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 288.w,
        height: 179.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: AppTheme.gradient2,
        ),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'An everyday gift for you!',
                    style: AppTextStyles.textStyle6.copyWith(
                      letterSpacing: 0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Comeback tomorrow for another gift!',
                    style: AppTextStyles.textStyle2.copyWith(
                      color: AppTheme.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('+100', style: AppTextStyles.textStyle11),
                      SizedBox(width: 7.w),
                      Image.asset(
                        'assets/png/icons/coins.png',
                        width: 31.sp,
                        height: 31.sp,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            CustomButton1(
              text: 'THANKS!',
              width: 256.w,
              height: 39.h,
              textStyle: AppTextStyles.textStyle10,
              onTap: Navigator.of(context).pop,
            ),
          ],
        ),
      ),
    );
  }
}
