import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:race_bet_rodeo/utils/utils.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BGWidget(
      child: Column(
        children: [
          const ShopAppBar(coins: 100),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: Column(
                children: [
                  SizedBox(
                    width: 331.w,
                    child: Text(
                      'Hippodrome backgrounds',
                      style: AppTextStyles.textStyle6.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Container(
                    width: 331.w,
                    alignment: Alignment.centerLeft,
                    child: BorderedButton1(
                      text: 'SEE ALL',
                      onTap: () => context.go('/shop/bg'),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    height: 183.h,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 22.w),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: const BGCard(),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24.h),
                  const PremiumOfferBox(),
                  SizedBox(height: 24.h),
                  SizedBox(
                    width: 331.w,
                    child: Opacity(
                      opacity: 0.5,
                      child: Text(
                        'Rider skins',
                        style: AppTextStyles.textStyle6.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Container(
                    width: 331.w,
                    alignment: Alignment.centerLeft,
                    child: BorderedButton1(
                      text: 'SEE ALL',
                      onTap: () => context.go('/shop/riders'),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  SizedBox(
                    height: 183.h,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 22.w),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: const RiderCard(),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24.h),
                  const DevelopingPart(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
