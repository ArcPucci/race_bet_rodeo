import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:race_bet_rodeo/providers/providers.dart';
import 'package:race_bet_rodeo/screens/premium_screen.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return BGWidget(
          child: Stack(
            children: [
              Positioned(
                top: 310.h,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: Center(
                    child: Image.asset(
                      'assets/png/lines3.png',
                      width: 395.w,
                      height: 206.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Column(
                  children: [
                    const CustomAppBar2(text: 'SETTINGS'),
                    SizedBox(height: 24.h),
                    const CustomButton2(
                      asset: 'assets/png/icons/privacy.png',
                      text: 'Privacy Policy',
                    ),
                    SizedBox(height: 16.h),
                    const CustomButton2(
                      asset: 'assets/png/icons/terms.png',
                      text: 'Terms of use',
                    ),
                    SizedBox(height: 16.h),
                    const CustomButton2(
                      asset: 'assets/png/icons/support.png',
                      text: 'Support',
                    ),
                    SizedBox(height: 16.h),
                    if (!value.premium)
                      PremiumButton(onTap: () => onTapPremium(context)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void onTapPremium(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (context) => const PremiumScreen(),
    );

    Navigator.of(context, rootNavigator: true).push(route);
  }
}
