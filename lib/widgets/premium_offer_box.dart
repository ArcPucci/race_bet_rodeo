import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/screens/screens.dart';
import 'package:race_bet_rodeo/utils/utils.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class PremiumOfferBox extends StatelessWidget {
  const PremiumOfferBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 331.w,
      height: 105.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(10.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'You can permanently unlock all skins\njust by buying a Premium!',
            textAlign: TextAlign.center,
            style: AppTextStyles.textStyle10,
          ),
          PremiumButton(
            height: 39.h,
            color: AppTheme.yellow,
            onTap: () => onTapPremium(context),
          ),
        ],
      ),
    );
  }

  void onTapPremium(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (context) => const PremiumScreen(),
    );

    Navigator.of(context, rootNavigator: true).push(route);
  }
}
