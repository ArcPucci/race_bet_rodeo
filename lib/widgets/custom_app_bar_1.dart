import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';

class CustomAppBar1 extends StatelessWidget {
  const CustomAppBar1({
    super.key,
    this.onTapSettings,
    this.onTapShop,
  });

  final VoidCallback? onTapSettings;
  final VoidCallback? onTapShop;

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
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 12.h),
      child: SizedBox(
        width: 331.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onTapSettings,
              child: Image.asset(
                'assets/png/icons/settings.png',
                width: 41.r,
                height: 41.r,
                fit: BoxFit.cover,
              ),
            ),
            Text('Game', style: AppTextStyles.textStyle3),
            GestureDetector(
              onTap: onTapShop,
              child: Image.asset(
                'assets/png/icons/shop.png',
                width: 41.r,
                height: 41.r,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
