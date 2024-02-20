import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:race_bet_rodeo/providers/providers.dart';
import 'package:race_bet_rodeo/utils/utils.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<StoreProvider>(
      context,
      listen: false,
    );
    provider.updateBGList();
    provider.updateSkinsList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return BGWidget(
          child: Column(
            children: [
              ShopAppBar(coins: value.coins),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 331.w,
                        child: Text(
                          'Hippodrome backgrounds',
                          style: AppTextStyles.textStyle6.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Container(
                        width: 331.w,
                        alignment: Alignment.centerLeft,
                        child: BorderedButton1(
                          text: 'SEE ALL',
                          onTap: () => context.go('/shop/bg'),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 183.h,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 22.w),
                          scrollDirection: Axis.horizontal,
                          itemCount: value.allBG.length,
                          itemBuilder: (context, index) {
                            final bg = value.allBG[index];
                            final selected =
                                value.selectedBackground.id == bg.id;
                            final bought = value.backgrounds.contains(bg.id);
                            return Padding(
                              padding: EdgeInsets.only(right: 16.w),
                              child: BGCard(
                                selected: selected,
                                bought: bought,
                                background: bg,
                                onTap: () => value.onSelectBGSkin(bg),
                              ),
                            );
                          },
                        ),
                      ),
                      if (!value.premium) ...[
                        SizedBox(height: 24.h),
                        const PremiumOfferBox(),
                      ],
                      SizedBox(height: 24.h),
                      SizedBox(
                        width: 331.w,
                        child: Opacity(
                          opacity: 0.5,
                          child: Text(
                            'Rider skins',
                            style: AppTextStyles.textStyle6.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Container(
                        width: 331.w,
                        alignment: Alignment.centerLeft,
                        child: BorderedButton1(
                          text: 'SEE ALL',
                          onTap: () => context.go('/shop/riders'),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      SizedBox(
                        height: 183.h,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 22.w),
                          scrollDirection: Axis.horizontal,
                          itemCount: value.allRiders.length,
                          itemBuilder: (context, index) {
                            final rider = value.allRiders[index];
                            final selected = value.selectedRider.id == rider.id;
                            final bought = value.skins.contains(rider.id);
                            return Padding(
                              padding: EdgeInsets.only(right: 16.w),
                              child: RiderCard(
                                selected: selected,
                                bought: bought,
                                rider: rider,
                                onTap: () => value.onSelectRiderSkin(rider),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 24.h),
                      const DevelopingPart(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
