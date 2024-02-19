import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';

class RaceDetails extends StatelessWidget {
  const RaceDetails({
    super.key,
    required this.horsesCount,
    required this.bet,
    required this.number,
  });

  final int horsesCount;
  final int bet;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextBody(
                  title: 'Horses involved:',
                  content: '$horsesCount',
                ),
                _buildTextBody(title: 'Your horse №:', content: '$number'),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 12.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextBody(
                    title: 'Race duration:',
                    content: '60sec',
                  ),
                  _buildTextBody(
                    title: 'Your bid: ',
                    content: '$bet',
                    color: AppTheme.yellow,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
