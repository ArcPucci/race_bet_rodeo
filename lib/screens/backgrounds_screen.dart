import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:race_bet_rodeo/providers/providers.dart';
import 'package:race_bet_rodeo/utils/app_text_styles.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class BackgroundsScreen extends StatelessWidget {
  const BackgroundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return BGWidget(
          child: Column(
            children: [
              const CustomAppBar2(text: 'ALL BACKGROUNDS'),
              SizedBox(height: 16.h),
              Row(
                children: [
                  SizedBox(width: 22.w),
                  Text(
                    'Hippodrome backgrounds',
                    style: AppTextStyles.textStyle6.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  CoinsBox(
                    coins: 100,
                    height: 41.h,
                  ),
                  SizedBox(width: 6.w),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 22.w),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 183.h,
                    mainAxisSpacing: 19.h,
                    crossAxisSpacing: 19.w,
                  ),
                  itemCount: value.allBG.length,
                  itemBuilder: (context, index) {
                    final bg = value.allBG[index];
                    final selected = value.selectedBackground.id == bg.id;
                    final bought = value.backgrounds.contains(bg.id);
                    return BGCard(
                      selected: selected,
                      bought: bought,
                      background: bg,
                      onTap: () => value.onSelectBGSkin(bg),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
