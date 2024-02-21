import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/models/models.dart';
import 'package:race_bet_rodeo/utils/utils.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class HorseCard extends StatelessWidget {
  const HorseCard({
    super.key,
    this.onChoose,
    required this.horse,
    this.enabled = true,
  });

  final VoidCallback? onChoose;
  final Horse horse;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 331.w,
      height: 301.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: 10.w),
              Text(
                'Name: ',
                style: AppTextStyles.textStyle4,
              ),
              SizedBox(width: 5.w),
              Text(
                horse.name,
                style: AppTextStyles.textStyle6.copyWith(
                  color: AppTheme.black3,
                  height: 28 / 20,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 10.w),
              Text(
                '№: ',
                style: AppTextStyles.textStyle4,
              ),
              SizedBox(width: 5.w),
              Text(
                '${horse.no}',
                style: AppTextStyles.textStyle6.copyWith(
                  color: AppTheme.black3,
                  height: 28 / 20,
                ),
              ),
            ],
          ),
          Container(
            width: 331.w,
            height: 239.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 30.r,
                ),
              ],
            ),
            padding: EdgeInsets.only(
              left: 10.w,
              top: 10.h,
              bottom: 10.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 2.w,
                      height: 17.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppTheme.green,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text('Last race:', style: AppTextStyles.textStyle9),
                    SizedBox(width: 4.w),
                    Text(
                      horse.lastRaceWon ? 'won' : 'lost',
                      style: AppTextStyles.textStyle9.copyWith(
                        fontWeight: FontWeight.w700,
                        color:
                            horse.lastRaceWon ? AppTheme.green : AppTheme.red,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Age', style: AppTextStyles.textStyle7),
                        Text('Horse gender:', style: AppTextStyles.textStyle7),
                        Text('Uses blinders:', style: AppTextStyles.textStyle7),
                        Text('Win/Lose:', style: AppTextStyles.textStyle7),
                        Text('Total races:', style: AppTextStyles.textStyle7),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${horse.age} years',
                            style: AppTextStyles.textStyle8),
                        Text(horse.gender, style: AppTextStyles.textStyle8),
                        Text(
                          horse.usesBlenders ? 'yes' : 'no',
                          style: AppTextStyles.textStyle8,
                        ),
                        Text(
                          '${horse.win}/${horse.lose}',
                          style: AppTextStyles.textStyle8,
                        ),
                        Text(
                          '${horse.win + horse.lose}',
                          style: AppTextStyles.textStyle8,
                        ),
                      ],
                    ),
                    Container(
                      width: 108.w,
                      height: 130.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(4),
                        ),
                        image: DecorationImage(
                          image: AssetImage(horse.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                    ),
                  ],
                ),
                CustomButton1(
                  text: 'CHOOSE',
                  height: 39.h,
                  textStyle: AppTextStyles.textStyle10,
                  onTap: onChoose,
                  enabled: enabled,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
