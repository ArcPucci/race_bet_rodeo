import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:race_bet_rodeo/utils/utils.dart';
import 'package:race_bet_rodeo/widgets/coins_box.dart';

class ShopAppBar extends StatelessWidget {
  const ShopAppBar({super.key, required this.coins});

  final int coins;

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Container(
      width: 375.w,
      height: overlay.top + 56.h,
      decoration: const BoxDecoration(
        color: AppTheme.yellow,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      padding: EdgeInsets.only(bottom: 12.h, left: 20.w, right: 20.w),
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 41.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 91.w,
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: context.pop,
                child: Image.asset(
                  'assets/png/icons/back.png',
                  width: 24.sp,
                  height: 24.sp,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text('SHOP', style: AppTextStyles.textStyle3),
            CoinsBox(height: 41.h),
          ],
        ),
      ),
    );
  }
}
