import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class RaceScreen extends StatelessWidget {
  const RaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BGWidget(
      child: Column(
        children: [
          const GameAppBar(),
          SizedBox(height: 24.h),
          SizedBox(
            width: 331.w,
            child: Row(
              children: [
                Text(
                  'Information about the ',
                  style: AppTextStyles.textStyle4,
                ),
                Text(
                  'Race',
                  style: AppTextStyles.textStyle4.copyWith(
                    color: AppTheme.yellow,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            width: 331.w,
            height: 123.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                width: 1.sp,
                color: AppTheme.grey3,
              ),
            ),
            padding: EdgeInsets.all(12.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextBody(title: 'Horses involved:', content: '6'),
                    _buildTextBody(title: 'Your horse №:', content: '№33'),
                  ],
                ),
                SizedBox(width: 80.w),
                _buildTextBody(
                  title: 'Your bid: ',
                  content: '50',
                  color: AppTheme.yellow,
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  'assets/png/lines.png',
                  width: 317.sp,
                  height: 240.sp,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: Column(
                    children: [
                      SizedBox(height: 24.h),
                      SizedBox(
                        width: 331.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 9.w),
                              child: Text(
                                'Your horse',
                                style: AppTextStyles.textStyle6,
                              ),
                            ),
                            _buildTextRow('Name', 'Spirit'),
                            _buildTextRow('№:', '33'),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: 331.w,
                        height: 101.h,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/png/bg/bg1.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1.sp,
                            color: AppTheme.whiteAccent2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              'assets/png/riders/rider1.png',
                              width: 84.w,
                              height: 56.h,
                              colorBlendMode: BlendMode.multiply,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 3.h),
                            const TrackWidget(value: 0.4),
                            SizedBox(height: 2.h),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Time:',
                            style: AppTextStyles.textStyle7.copyWith(
                              color: AppTheme.grey3,
                              letterSpacing: 0,
                            ),
                          ),
                          SizedBox(width: 9.w),
                          Text(
                            '0/60 sec',
                            style: AppTextStyles.textStyle5.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: 331.w,
                        child: Text(
                          'Other horses',
                          style: AppTextStyles.textStyle6.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: 331.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1.sp,
                            color: AppTheme.whiteAccent2,
                          ),
                        ),
                        padding: EdgeInsets.only(top: 13.h, bottom: 8.h),
                        child: Column(
                          children: List.generate(
                            5,
                            (index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  top: index != 0 ? 16.h : 0,
                                ),
                                child: const RaceCard(),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextRow(String text, String text2) {
    return Row(
      children: [
        Text(
          '$text: ',
          style: AppTextStyles.textStyle7.copyWith(
            color: AppTheme.grey3,
          ),
        ),
        SizedBox(width: 5.w),
        Text(
          text2,
          style: AppTextStyles.textStyle7.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildTextBody({
    required String title,
    required String content,
    Color? color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.textStyle12.copyWith(
            color: AppTheme.grey3,
          ),
        ),
        Text(
          content,
          style: AppTextStyles.textStyle5.copyWith(
            color: color ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
