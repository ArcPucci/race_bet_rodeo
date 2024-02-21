import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:race_bet_rodeo/data/data.dart';
import 'package:race_bet_rodeo/models/models.dart';
import 'package:race_bet_rodeo/providers/providers.dart';

class RidersProvider extends ChangeNotifier {
  final GoRouter _router;
  final StoreProvider _storeProvider;

  RidersProvider({
    required GoRouter router,
    required StoreProvider storeProvider,
  })  : _router = router,
        _storeProvider = storeProvider;

  List<Horse> _horses = [];

  List<Horse> get horses => _horses;

  int _bet = 50;

  int get bet => _bet;

  int _place = 0;

  int get place => _place;

  int get award => bet * _horses.length;

  void onGenerate() {
    _horses.clear();
    final numbersList = [];
    final namesList = [];
    int horsesNumber = Random().nextInt(3) + 5;

    final images = List.from(HorseData.images);

    images.shuffle();

    for (int i = 0; i < horsesNumber; i++) {
      int randNumber = Random().nextInt(99) + 1;

      while (numbersList.contains(randNumber)) {
        randNumber = Random().nextInt(99) + 1;
      }

      numbersList.add(randNumber);

      String name = '';
      int randName = Random().nextInt(HorseData.maleNames.length);
      name = HorseData.maleNames[randName];
      bool male = Random().nextBool();

      if (male) {
        randName = Random().nextInt(HorseData.maleNames.length);
        while (namesList.contains(name)) {
          randName = Random().nextInt(HorseData.maleNames.length);
          name = HorseData.maleNames[randName];
        }
      } else {
        randName = Random().nextInt(HorseData.femaleNames.length);
        while (namesList.contains(name)) {
          randName = Random().nextInt(HorseData.femaleNames.length);
          name = HorseData.femaleNames[randName];
        }
      }

      namesList.add(name);

      int age = Random().nextInt(3) + 1;
      int win = Random().nextInt(22) + 3;
      int lose = Random().nextInt(5);
      bool usesBlenders = Random().nextBool();
      bool lastRaceWon = Random().nextBool();

      while (win <= lose) {
        win = Random().nextInt(22) + 3;
      }

      final horse = Horse(
        id: i,
        name: name,
        no: randNumber,
        lastRaceWon: lastRaceWon,
        age: age,
        gender: male ? 'stallion' : 'mare',
        usesBlenders: usesBlenders,
        win: win,
        lose: lose,
        image: images[i],
      );

      _horses.add(horse);
    }

    notifyListeners();
  }

  void onSetBet(int bet, int index) {
    _bet = bet;
    _storeProvider.onUseMoney(_bet);
    if (index != 0) {
      final horse = _horses[index];
      _horses.removeAt(index);
      _horses = [horse, ...horses];
    }
    _router.go('/race');
  }

  void setPlace(int place) {
    _place = place;
    if (_place == 1) {
      _storeProvider.onAddMoney(award);
    }
    _router.go('/result');
  }
}
