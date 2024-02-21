import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';
import 'package:race_bet_rodeo/widgets/buttons/custom_button_1.dart';
import 'package:race_bet_rodeo/widgets/custom_input.dart';

class BetDialog extends StatefulWidget {
  const BetDialog({
    super.key,
    required this.onConfirm,
    this.correct = false,
    required this.coins,
  });

  final void Function(int bet) onConfirm;
  final bool correct;
  final int coins;

  @override
  State<BetDialog> createState() => _BetDialogState();
}

class _BetDialogState extends State<BetDialog> {
  final controller = TextEditingController();

  bool entered = false;

  bool get correct => bet <= widget.coins || !entered;

  int bet = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(
      () => setState(() {
        if (controller.text.isNotEmpty) bet = int.parse(controller.text);
        entered = false;
      }),
    );
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    super.dispose();
  }

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
                    correct
                        ? SizedBox(height: 20.h)
                        : Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Text(
                              "You don't have enough coins for this bet!",
                              style: AppTextStyles.textStyle2.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppTheme.red,
                              ),
                            ),
                          ),
                    CustomInput(
                      correct: correct,
                      controller: controller,
                    ),
                    SizedBox(height: 16.h),
                    CustomButton1(
                      text: 'CONFIRM',
                      textStyle: AppTextStyles.textStyle5.copyWith(
                        color: Colors.black,
                      ),
                      onTap: () {
                        entered = true;
                        setState(() {});

                        if (bet < 50 || bet > widget.coins) return;

                        Navigator.of(context).pop();
                        widget.onConfirm.call(bet);
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
