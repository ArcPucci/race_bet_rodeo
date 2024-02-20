import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class RiderCard extends StatelessWidget {
  const RiderCard({
    super.key,
    this.mini = false,
  });

  final bool mini;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 274.w,
      height: 183.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 254.w,
            height: 118.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1.sp,
                color: Colors.black.withOpacity(0.1),
              ),
            ),
            alignment: Alignment.center,
            child: Image.asset(
              'assets/png/riders/rider2.png',
              width: 161.w,
              height: 106.h,
              fit: BoxFit.contain,
            ),
          ),
          BuyButton(
            coins: 20,
            borderRadius: mini ? 8 : null,
            hasBought: false,
            selected: true,
          ),
        ],
      ),
    );
  }
}
