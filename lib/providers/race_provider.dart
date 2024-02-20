import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:race_bet_rodeo/models/models.dart';
import 'package:race_bet_rodeo/providers/providers.dart';

class RaceProvider extends ChangeNotifier {
  RaceProvider({
    required StoreProvider storeProvider,
  }) : rider = storeProvider.selectedRider,
  background = storeProvider.selectedBackground{
    init();
  }

  final Rider rider;

  final Background background;

  int _duration = 600000;

  int get time => _time;

  int _time = 0;

  Timer? _timer;

  List<double> speeds = List.generate(
    6,
    (index) => Random().nextDouble() / 500,
  );

  List<double> distances = List.generate(6, (index) => 0);

  void init() {
    _duration = 60000;
    _time = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_duration % 1000 == 0) _time++;
      if (_duration <= 0) {
        _timer?.cancel();
        return;
      }
      for (int i = 0; i < distances.length; i++) {
        if (distances[i] >= 1) {
          _timer?.cancel();
          return;
        }
      }
      if (_duration % 10000 == 0) {
        for (int i = 0; i < speeds.length; i++) {
          speeds[i] = Random().nextDouble() / 400;
        }
      }

      _duration -= 100;

      for (int i = 0; i < distances.length; i++) {
        distances[i] += speeds[i];
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
