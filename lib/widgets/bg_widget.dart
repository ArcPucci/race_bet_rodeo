import 'package:flutter/material.dart';
import 'package:race_bet_rodeo/utils/utils.dart';

class BGWidget extends StatelessWidget {
  const BGWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.gradient2,
        ),
        child: child,
      ),
    );
  }
}
