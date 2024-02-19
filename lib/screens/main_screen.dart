import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:race_bet_rodeo/utils/utils.dart';
import 'package:race_bet_rodeo/widgets/coins_box.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BGWidget(
      child: Column(
        children: [
          CustomAppBar1(
            onTapSettings: () => context.go('/settings'),
            onTapShop: () => context.go('/shop'),
          ),
          SizedBox(height: 28.h),
          SizedBox(
            width: 331.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choice of horse',
                      style: AppTextStyles.textStyle4,
                    ),
                    Text(
                      'Total horses in this race: 6',
                      style: AppTextStyles.textStyle5,
                    ),
                  ],
                ),
                const CoinsBox(coins: 100),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: HorseCard(
                          onChoose: () => showBetDialog(context),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showBetDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (context) {
        return BetDialog(onConfirm: () => context.go('/race'));
      },
    );
  }

  void showGiftDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (context) {
        return const Center(child: EverydayGiftDialog());
      },
    );
  }
}
