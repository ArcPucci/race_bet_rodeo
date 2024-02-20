import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class RiderSkinsScreen extends StatelessWidget {
  const RiderSkinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BGWidget(
      child: Column(
        children: [
          const CustomAppBar2(text: 'ALL RIDER SKINS'),
          SizedBox(height: 16.h),
          Row(
            children: [
              SizedBox(width: 22.w),
              Text(
                'Rider skins',
                style: AppTextStyles.textStyle6.copyWith(
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              CoinsBox(
                coins: 100,
                height: 41.h,
              ),
              SizedBox(width: 6.w),
            ],
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 22.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 183.h,
                mainAxisSpacing: 19.h,
                crossAxisSpacing: 19.w,
              ),
              itemBuilder: (context, index) {
                return RiderCard(
                  mini: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
