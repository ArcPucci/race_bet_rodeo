import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:race_bet_rodeo/utils/utils.dart';

class CustomAppBar2 extends StatelessWidget {
  const CustomAppBar2({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Container(
      width: 375.w,
      height: 56.h + overlay.top,
      decoration: const BoxDecoration(
        color: AppTheme.yellow,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 12.h),
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 41.r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: context.pop,
              child: Image.asset(
                'assets/png/icons/back.png',
                width: 24.r,
                height: 24.r,
                fit: BoxFit.cover,
              ),
            ),
            Text(text, style: AppTextStyles.textStyle3),
            SizedBox(width: 24.r),
          ],
        ),
      ),
    );
  }
}
