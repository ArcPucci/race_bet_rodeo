import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:race_bet_rodeo/providers/providers.dart';
import 'package:race_bet_rodeo/utils/app_text_styles.dart';
import 'package:race_bet_rodeo/utils/app_theme.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RidersProvider>(
      builder: (BuildContext context, value, Widget? child) {
        final won = value.place == 1;
        return BGWidget(
          hasGradient: false,
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                const CustomAppBar2(text: 'END OF THE RACE'),
                Expanded(
                  child: Container(
                    width: 375.w,
                    height: 603.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/png/lines2.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 96.h),
                        Text(
                          'The race is over.',
                          style: AppTextStyles.textStyle4,
                        ),
                        Text(
                          won ? 'Congratulations!' : 'Bad luck...',
                          style: AppTextStyles.textStyle14.copyWith(
                            color: won ? null : AppTheme.red,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Image.asset(
                          won
                              ? 'assets/png/coins2.png'
                              : 'assets/png/coins3.png',
                          width: 199.w,
                          height: 122.h,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          width: 287.w,
                          height: 101.h,
                          decoration: BoxDecoration(
                            gradient: AppTheme.gradient2,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1.sp,
                              color: AppTheme.whiteAccent3,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                won ? '+${value.award}' : '-${value.bet}',
                                style: AppTextStyles.textStyle14.copyWith(
                                  color: won ? null : AppTheme.red,
                                ),
                              ),
                              SizedBox(width: 7.w),
                              Image.asset(
                                'assets/png/icons/coins.png',
                                width: 49.sp,
                                height: 49.sp,
                                color: won ? null : AppTheme.red,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 22.h),
                        RichText(
                          text: TextSpan(
                            text: 'You took ',
                            style: AppTextStyles.textStyle3.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: getPlace(value.place),
                                style: AppTextStyles.textStyle15.copyWith(
                                  color: won ? null : AppTheme.red,
                                ),
                              ),
                              TextSpan(
                                text: ' place!',
                                style: AppTextStyles.textStyle3.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomButton1(
                  text: 'MAIN MENU',
                  onTap: context.pop,
                ),
                SizedBox(height: 28.h),
              ],
            ),
          ),
        );
      },
    );
  }

  String getPlace(int place) {
    if (place == 1) return '1st';
    if (place == 2) return '2nd';
    if (place == 3) return '3rd';
    return '${place}th';
  }
}
