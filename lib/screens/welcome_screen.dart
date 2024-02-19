import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.gradient1,
        ),
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return AppTheme.gradient1.createShader(bounds);
          },
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 83.h),
                Image.asset(
                  'assets/png/rodeo.png',
                  width: 193.sp,
                  height: 133.sp,
                  colorBlendMode: BlendMode.darken,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 10.h),
                Image.asset(
                  'assets/png/logo.png',
                  height: 92.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 35.h),
                SizedBox(
                  width: 331.w,
                  child: Text(
                    'All horses are virtual and do not participate in real races. We do not accept real money bets, this is just a game for fun!',
                    style: AppTextStyles.textStyle1,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                const CustomButton1(text: 'LETS PLAY!'),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 171.5.w,
                      height: 40.h,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: Text(
                        'Terms of Use',
                        style: AppTextStyles.textStyle2,
                      ),
                    ),
                    Container(
                      width: 171.5.w,
                      height: 40.h,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: Text(
                        'Privacy Policy',
                        style: AppTextStyles.textStyle2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
