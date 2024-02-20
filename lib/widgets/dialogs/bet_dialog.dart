import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';
import 'package:race_bet_rodeo/widgets/buttons/custom_button_1.dart';
import 'package:race_bet_rodeo/widgets/custom_input.dart';

class BetDialog extends StatelessWidget {
  const BetDialog({super.key, this.onConfirm});

  final VoidCallback? onConfirm;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              Container(
                width: 375.w,
                decoration: const BoxDecoration(
                  gradient: AppTheme.gradient2,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                ),
                padding: EdgeInsets.only(top: 16.h, bottom: 22.h),
                child: Column(
                  children: [
                    Text(
                      'How many coins do\nyou want to bet?',
                      style: AppTextStyles.textStyle6.copyWith(
                        color: Colors.black,
                        letterSpacing: 0,
                        height: 24 / 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
                    CustomInput(controller: TextEditingController()),
                    SizedBox(height: 16.h),
                    CustomButton1(
                      text: 'CONFIRM',
                      textStyle: AppTextStyles.textStyle5.copyWith(
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        onConfirm?.call();
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 10.w,
                top: 10.h,
                child: GestureDetector(
                  onTap: Navigator.of(context).pop,
                  child: Image.asset(
                    'assets/png/icons/close.png',
                    width: 27.sp,
                    height: 27.sp,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
      ],
    );
  }
}
