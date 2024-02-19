import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class BoostCard extends StatelessWidget {
  const BoostCard({
    super.key,
    required this.races,
    required this.price,
  });

  final int races;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.w,
      height: 125.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage('assets/png/box.png'),
          fit: BoxFit.contain,
        ),
      ),
      padding: EdgeInsets.all(10.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Boost your horse\nfor\n',
              style: AppTextStyles.textStyle10,
              children: [
                TextSpan(
                  text: '$races ',
                  style: AppTextStyles.textStyle12.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: 'race',
                  style: AppTextStyles.textStyle10,
                ),
              ],
            ),
          ),
          CustomButton3(
            width: 136.w,
            height: 39.h,
            coins: price,
          ),
        ],
      ),
    );
  }
}
