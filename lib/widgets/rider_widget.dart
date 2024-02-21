import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:race_bet_rodeo/models/models.dart';

class RiderWidget extends StatefulWidget {
  const RiderWidget({
    super.key,
    required this.rider,
    required this.speed,
  });

  final Rider rider;
  final double speed;

  @override
  State<RiderWidget> createState() => _RiderWidgetState();
}

class _RiderWidgetState extends State<RiderWidget> {
  List<String> assets = [
    'assets/png/riders/rider1_6.png',
    'assets/png/riders/rider1.png',
    'assets/png/riders/rider1_3.png',
    'assets/png/riders/rider1_4.png',
    'assets/png/riders/rider1_2.png',
    'assets/png/riders/rider1_5.png',
  ];

  Timer? _timer;

  int index = 0;

  String get image =>
      widget.rider.id == -1 ? assets[index] : widget.rider.image;

  Timer? _mainTimer;

  @override
  void initState() {
    super.initState();
    if (widget.rider.id == -1) {
      onCreateNewTimer();
      _mainTimer = Timer.periodic(Duration(seconds: 10), (timer) {
        onCreateNewTimer();
      });
    }
  }

  void onCreateNewTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(
      Duration(
        milliseconds: (125 / (widget.speed * 400)).round(),
      ),
      (timer) {
        if (index == assets.length - 1) {
          index = 0;
        } else {
          index++;
        }
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _mainTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 84.w,
      height: 56.h,
      fit: BoxFit.contain,
    );
  }
}
