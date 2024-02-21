import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/utils/utils.dart';

class CustomInput extends StatefulWidget {
  const CustomInput({
    super.key,
    required this.controller,
    this.correct = true,
  });

  final TextEditingController controller;
  final bool correct;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: focusNode.requestFocus,
      child: Container(
        width: 331.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1.sp,
            color: AppTheme.black4,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                focusNode: focusNode,
                autofocus: true,
                keyboardType: TextInputType.number,
                controller: widget.controller,
                style: AppTextStyles.textStyle1.copyWith(
                  fontWeight: FontWeight.w500,
                  color: widget.correct ? AppTheme.yellow : AppTheme.red,
                ),
                decoration: const InputDecoration.collapsed(
                  hintText: '',
                ),
              ),
            ),
            Image.asset(
              'assets/png/icons/coins.png',
              width: 31.sp,
              height: 31.sp,
              color: widget.correct ? null : AppTheme.red,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
