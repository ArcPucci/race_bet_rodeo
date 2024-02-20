import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/models/models.dart';
import 'package:race_bet_rodeo/widgets/widgets.dart';

class BGCard extends StatelessWidget {
  const BGCard({
    super.key,
    this.mini = false,
    required this.background,
    this.selected = false,
    this.bought = false, this.onTap,
  });

  final bool mini;
  final Background background;
  final bool selected;
  final bool bought;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 274.w,
      height: 183.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              mini ? background.smallImage : background.image,
              width: 254.w,
              height: 118.h,
              fit: BoxFit.cover,
            ),
          ),
          BuyButton(
            coins: background.price,
            borderRadius: mini ? 8 : null,
            bought: bought,
            selected: selected,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
