import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:race_bet_rodeo/utils/utils.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        'Do you really want to\nleave the Race?',
        style: AppTextStyles.dialogTitle,
      ),
      content: Text(
        'You will lose the coins you bet!',
        style: AppTextStyles.dialogContent,
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
            context.pop();
          },
          child: Text(
            'Leave',
            style: AppTextStyles.dialogTitle.copyWith(
              color: AppTheme.systemRed,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: Navigator.of(context).pop,
          child: Text(
            'No',
            style: AppTextStyles.dialogTitle.copyWith(
              color: AppTheme.systemBlue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
