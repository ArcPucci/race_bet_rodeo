import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:race_bet_rodeo/providers/providers.dart';
import 'package:race_bet_rodeo/utils/utils.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final provider = Provider.of<StoreProvider>(
        context,
        listen: false,
      );

      if (!await provider.canGetGift()) return;

      provider.onAddMoney(100);
      showGiftDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<RidersProvider, StoreProvider>(
      builder: (BuildContext context, value, store, Widget? child) {
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
                          'Total horses in this race: ${value.horses.length}',
                          style: AppTextStyles.textStyle5,
                        ),
                      ],
                    ),
                    const CoinsBox(),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ListView.builder(
                        itemCount: value.horses.length,
                        padding: EdgeInsets.symmetric(
                          horizontal: 22.w,
                          vertical: 24.h,
                        ),
                        itemBuilder: (context, index) {
                          final horse = value.horses[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: HorseCard(
                              horse: horse,
                              enabled: store.coins >= 50,
                              onChoose: () => showBetDialog(
                                context,
                                store.coins,
                                index,
                                value,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: 30.h,
                      right: 22.w,
                      child: CustomButton4(onTap: value.onGenerate),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showBetDialog(
    BuildContext context,
    int coins,
    int index,
    RidersProvider provider,
  ) async {
    await showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (context) {
        return BetDialog(
          coins: coins,
          onConfirm: (bet) {
            provider.onSetBet(bet, index);
          },
        );
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
