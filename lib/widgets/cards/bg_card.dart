import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class BGCard extends StatelessWidget {
  const BGCard({
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
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              mini ? 'assets/png/bg/mini_bg_2.png' : 'assets/png/bg/bg2.png',
              width: 254.w,
              height: 118.h,
              fit: BoxFit.cover,
            ),
          ),
          BuyButton(
            coins: 20,
            borderRadius: mini ? 8 : null,
          ),
        ],
      ),
    );
  }
}
