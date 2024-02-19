import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';

class PremiumButton extends StatelessWidget {
  const PremiumButton({
    super.key,
    this.onTap,
    this.hasBorder = false,
  });

  final VoidCallback? onTap;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 331.w,
        height: 50.h,
        decoration: BoxDecoration(
          gradient: AppTheme.gradient1,
          borderRadius: BorderRadius.circular(5),
          border: hasBorder
              ? Border.all(
                  width: 1.sp,
                  color: Colors.black.withOpacity(0.5),
                )
              : null,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Make a purchase for ',
              style: AppTextStyles.textStyle10.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '\$2.99',
              style: AppTextStyles.textStyle10.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
