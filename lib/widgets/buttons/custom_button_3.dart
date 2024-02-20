import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';

class BuyButton extends StatelessWidget {
  const BuyButton({
    super.key,
    this.onTap,
    this.width,
    this.height,
    required this.coins,
    this.borderRadius,
    this.bought = false,
    this.selected = false,
  });

  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final int coins;
  final double? borderRadius;
  final bool bought;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 254.w,
        height: height ?? 39.h,
        decoration: BoxDecoration(
          color: _getColor(),
          border: _buildBorder(),
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        alignment: Alignment.center,
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (!bought) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('BUY $coins', style: AppTextStyles.textStyle10),
          SizedBox(width: 5.w),
          Image.asset(
            'assets/png/icons/coins.png',
            width: 20.r,
            height: 20.r,
            color: Colors.black,
            fit: BoxFit.cover,
          ),
        ],
      );
    }
    if (selected) {
      return Text('REMOVE', style: AppTextStyles.textStyle10);
    }
    return Text('SELECT', style: AppTextStyles.textStyle10);
  }

  Border? _buildBorder() {
    if(!bought) return null;
    if(selected) {
      return Border.all(
        width: 1.sp,
        color: Colors.black,
      );
    }
    return null;
  }

  Color? _getColor() {
    if(!bought) return AppTheme.yellow;
    if(selected) return Colors.white;
    return AppTheme.yellow;
  }
}
