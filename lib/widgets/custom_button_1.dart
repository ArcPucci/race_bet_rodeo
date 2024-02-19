import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    super.key,
    this.onTap,
    required this.text,
    this.textStyle,
    this.height,
    this.width,
    this.enabled = true,
  });

  final String text;
  final double? width;
  final double? height;
  final bool enabled;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: width ?? 331.w,
        height: height ?? 60.h,
        decoration: BoxDecoration(
          color: enabled ? AppTheme.yellow : AppTheme.whiteAccent,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: textStyle?.copyWith(color: _getColor()) ??
              AppTextStyles.textStyle3.copyWith(color: _getColor()),
        ),
      ),
    );
  }

  Color? _getColor() {
    if (enabled) return null;
    return AppTheme.grey2;
  }
}
