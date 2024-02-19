import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/png/paywall.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: Navigator.of(context).pop,
                  child: Image.asset(
                    'assets/png/icons/close2.png',
                    width: 72.sp,
                    height: 72.sp,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Spacer(),
              PremiumButton(
                hasBorder: true,
                onTap: () {},
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: 343.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 114.33.w,
                        height: 40.h,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(
                          'Terms of Use',
                          style: AppTextStyles.textStyle2,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 114.33.w,
                        height: 40.h,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(
                          'Restore',
                          style: AppTextStyles.textStyle2,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 114.33.w,
                        height: 40.h,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(
                          'Privacy Policy',
                          style: AppTextStyles.textStyle2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }
}
