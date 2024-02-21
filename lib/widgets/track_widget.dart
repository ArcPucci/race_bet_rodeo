import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';

class TrackWidget extends StatelessWidget {
  const TrackWidget({
    super.key,
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 329.w,
      height: 10.sp,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            width: 329.w,
            height: 4.sp,
            decoration: BoxDecoration(
              color: AppTheme.whiteAccent2,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          Container(
            width: value * (329.w - 6.sp),
            height: 4.sp,
            decoration: BoxDecoration(
              color: AppTheme.yellow,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          Positioned(
            left: (value * (329.w - 12.sp)),
            child: Container(
              width: 10.sp,
              height: 10.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.yellow,
                border: Border.all(
                  width: 1.sp,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
