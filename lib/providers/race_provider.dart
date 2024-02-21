import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:race_bet_rodeo/models/models.dart';
import 'package:race_bet_rodeo/providers/providers.dart';

class RaceProvider extends ChangeNotifier {
  RaceProvider({
    required StoreProvider storeProvider,
    required RidersProvider ridersProvider,
  })  : _ridersProvider = ridersProvider,
        rider = storeProvider.selectedRider,
        bet = ridersProvider.bet,
        horses = ridersProvider.horses,
        background = storeProvider.selectedBackground {
    init();
  }

  final RidersProvider _ridersProvider;

  final Rider rider;

  final Background background;

  final int bet;

  final List<Horse> horses;

  int _duration = 600000;

  int get time => _time;

  int _time = 0;

  Timer? _timer;

  Horse get horse => horses.first;

  List<double> _speeds = [];

  List<double> _distances = [];

  List<double> get distances => _distances;

  void init() {
    _duration = 60000;
    _time = 0;
    _speeds = List.generate(
      horses.length,
      (index) => Random().nextDouble() / 500,
    );
    _distances = List.generate(horses.length, (index) => 0);
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_duration % 1000 == 0) _time++;
      if (_duration <= 0) {
        onFinish();
        return;
      }
      for (int i = 0; i < distances.length; i++) {
        if (distances[i] >= 1) {
          onFinish();
          return;
        }
      }
      if (_duration % 10000 == 0) {
        for (int i = 0; i < _speeds.length; i++) {
          _speeds[i] = Random().nextDouble() / 400;
        }
      }

      _duration -= 100;

      for (int i = 0; i < distances.length; i++) {
        distances[i] += _speeds[i];
      }
      notifyListeners();
    });
  }

  void onFinish() {
    _timer?.cancel();

    final distance = distances.first;
    distances.sort((a, b) => b.compareTo(a));

    final place = distances.indexOf(distance) + 1;

    _ridersProvider.setPlace(place);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
