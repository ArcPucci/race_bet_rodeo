import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:race_bet_rodeo/providers/race_provider.dart';
import 'package:race_bet_rodeo/utils/utils.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class RaceScreen extends StatelessWidget {
  const RaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return RaceProvider(
          storeProvider: Provider.of(context, listen: false),
          ridersProvider: Provider.of(context, listen: false),
        );
      },
      child: Consumer<RaceProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return BGWidget(
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  GameAppBar(onExit: () => showExitDialog(context)),
                  SizedBox(height: 24.h),
                  _buildTitle(),
                  SizedBox(height: 10.h),
                  RaceDetails(
                    horsesCount: value.horses.length,
                    bet: value.bet,
                    number: value.horse.no,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 9.w),
                                      child: Text(
                                        'Your horse',
                                        style: AppTextStyles.textStyle6,
                                      ),
                                    ),
                                    _buildTextRow('Name: ', value.horse.name),
                                    _buildTextRow('№: ', "${value.horse.no}"),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Container(
                                width: 331.w,
                                height: 101.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(value.background.image),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1.sp,
                                    color: AppTheme.whiteAccent2,
                                  ),
                                ),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Positioned(
                                      bottom: 12.h,
                                      left: 13.w + value.distances[0] * 220.w,
                                      child: RiderWidget(
                                        rider: value.rider,
                                        speed: value.speed,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TrackWidget(value: value.distances[0]),
                                        SizedBox(height: 2.h),
                                      ],
                                    ),
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
                                    '${value.time}/60 sec',
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
                              // SizedBox(height: 10.h),
                              Expanded(
                                child: SingleChildScrollView(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  child: Container(
                                    width: 331.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 1.sp,
                                        color: AppTheme.whiteAccent2,
                                      ),
                                    ),
                                    padding: EdgeInsets.only(
                                      top: 13.h,
                                      bottom: 8.h,
                                    ),
                                    child: Column(
                                      children: List.generate(
                                        value.horses.length - 1,
                                        (index) {
                                          final horse = value.horses[index + 1];
                                          return Padding(
                                            padding: EdgeInsets.only(
                                              top: index != 0 ? 16.h : 0,
                                            ),
                                            child: RaceCard(
                                              name: horse.name,
                                              no: horse.no,
                                              value: value.distances[index + 1],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
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
            ),
          );
        },
      ),
    );
  }

  Widget _buildTitle() {
    return SizedBox(
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
    );
  }

  Widget _buildTextRow(String text, String text2) {
    return Row(
      children: [
        Text(
          text,
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

  void showExitDialog(BuildContext context) async {
    await showCupertinoDialog(
      context: context,
      builder: (context) {
        return Center(child: ExitDialog());
      },
    );
  }
}
