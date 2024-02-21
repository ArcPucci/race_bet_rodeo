import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class RaceCard extends StatelessWidget {
  const RaceCard({
    super.key,
    required this.value,
    required this.name,
    required this.no,
  });

  final String name;
  final int no;
  final double value;

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
                  flex: 4,
                  child: Row(
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Text('Name:', style: AppTextStyles.textStyle7),
                      ),
                      SizedBox(width: 2.w),
                      Text(name, style: AppTextStyles.textStyle8),
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
                      Text('$no', style: AppTextStyles.textStyle8),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TrackWidget(value: value),
        ],
      ),
    );
  }
}
