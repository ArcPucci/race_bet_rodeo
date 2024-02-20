import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class RaceCard extends StatelessWidget {
  const RaceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 331.w,
      height: 36.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Row(
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Text('Name:', style: AppTextStyles.textStyle7),
                      ),
                      SizedBox(width: 2.w),
                      Text('Eliza', style: AppTextStyles.textStyle8),
                    ],
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Row(
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Text('№:', style: AppTextStyles.textStyle7),
                      ),
                      SizedBox(width: 2.w),
                      Text('13', style: AppTextStyles.textStyle8),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const TrackWidget(value: 1),
        ],
      ),
    );
  }
}
