import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';

class BorderedButton1 extends StatelessWidget {
  const BorderedButton1({
    super.key,
    this.onTap,
    required this.text,
  });

  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90.w,
        height: 30.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1.sp,
            color: AppTheme.grey3,
          ),
        ),
        alignment: Alignment.center,
        child: Text(text, style: AppTextStyles.textStyle13),
      ),
    );
  }
}
