import 'package:flutter/material.dart';
import 'package:race_bet_rodeo/utils/utils.dart';

class BGWidget extends StatelessWidget {
  const BGWidget({
    super.key,
    required this.child,
    this.hasGradient = true,
  });

  final bool hasGradient;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: hasGradient ? AppTheme.gradient2 : null,
        ),
        child: child,
      ),
    );
  }
}
