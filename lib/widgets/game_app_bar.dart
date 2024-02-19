import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';

class GameAppBar extends StatelessWidget {
  const GameAppBar({super.key, this.onExit});

  final VoidCallback? onExit;

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Container(
      width: 375.w,
      height: 56.h + overlay.top,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
        color: AppTheme.yellow,
      ),
      padding: EdgeInsets.only(left: 22.w, right: 22.w, bottom: 12.h),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 50.w),
          Text('RACE', style: AppTextStyles.textStyle3),
          SizedBox(
            width: 50.w,
            child: GestureDetector(
              onTap: onExit,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Exit', style: AppTextStyles.textStyle12),
                  Image.asset(
                    'assets/png/icons/exit.png',
                    width: 19.r,
                    height: 19.r,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
