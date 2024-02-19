import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class DevelopingPart extends StatelessWidget {
  const DevelopingPart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 331.w,
      height: 457.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rider skins',
                    style:
                        AppTextStyles.textStyle6.copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 16.h),
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BoostCard(races: 1, price: 10),
                            BoostCard(races: 2, price: 18),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BoostCard(races: 3, price: 25),
                            BoostCard(races: 4, price: 34),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BoostCard(races: 5, price: 42),
                            BoostCard(races: 6, price: 51),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 248.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              'Sorry, but this section is still\nunder development :(',
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyle5.copyWith(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
