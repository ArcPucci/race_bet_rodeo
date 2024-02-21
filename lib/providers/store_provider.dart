import 'package:flutter/material.dart';
import 'package:race_bet_rodeo/data/data.dart';
import 'package:race_bet_rodeo/models/models.dart';
import 'package:race_bet_rodeo/services/preferences_service.dart';

class StoreProvider extends ChangeNotifier {
  final PreferencesService _service;

  StoreProvider(this._service);

  Rider _selectedRider = Rider.defaultSkin();

  Rider get selectedRider => _selectedRider;

  Background _selectedBackground = Background.defaultBG();

  Background get selectedBackground => _selectedBackground;

  List<int> _skins = [];

  List<int> _backgrounds = [];

  List<int> get skins => _skins;

  List<int> get backgrounds => _backgrounds;

  int _coins = 0;

  int get coins => _coins;

  final List<Rider> _allRiders = [];

  List<Rider> get allRiders => _allRiders;

  final List<Background> _allBG = [];

  List<Background> get allBG => _allBG;

  bool _premium = false;

  bool get premium => _premium;

  void init() {
    _premium = _service.getPremium();
    _coins = _service.getCoins();
    _selectedRider = _service.getSkin();
    _selectedBackground = _service.getBG();
    _skins = _service.getSkins();
    _backgrounds = _service.getBGSkins();

    updateBGList();
    updateSkinsList();
  }

  void updateSkinsList() {
    _allRiders.clear();
    if (_selectedRider.id != -1) _allRiders.add(_selectedRider);

    for (final item in riderSkins) {
      if (!_skins.contains(item.id) || _allRiders.contains(item)) continue;
      _allRiders.add(item);
    }

    for (final item in riderSkins) {
      if (_allRiders.contains(item)) continue;
      _allRiders.add(item);
    }
  }

  void updateBGList() {
    _allBG.clear();
    if (_selectedBackground.id != -1) _allBG.add(_selectedBackground);

    for (final item in backgroundSkins) {
      if (!_backgrounds.contains(item.id) || _allBG.contains(item)) continue;
      _allBG.add(item);
    }

    for (final item in backgroundSkins) {
      if (_allBG.contains(item)) continue;
      _allBG.add(item);
    }
  }

  void onSelectRiderSkin(Rider rider) async {
    if (rider.id == _selectedRider.id) {
      _selectedRider = Rider.defaultSkin();
      await _service.setSkin(-1);

      notifyListeners();
      return;
    }

    if (_skins.contains(rider.id)) {
      _selectedRider = rider;
      await _service.setSkin(rider.id);
    } else if (rider.price <= _coins) {
      _coins -= rider.price;
      await _service.setCoins(_coins);
      _skins.add(rider.id);
      await _service.setSkins(_skins);
    }

    notifyListeners();
  }

  void onSelectBGSkin(Background background) async {
    if (background.id == _selectedBackground.id) {
      _selectedBackground = Background.defaultBG();
      await _service.setBG(-1);

      notifyListeners();
      return;
    }

    if (_backgrounds.contains(background.id)) {
      _selectedBackground = background;
      await _service.setBG(background.id);
    } else if (background.price <= _coins) {
      _coins -= background.price;
      await _service.setCoins(_coins);
      _backgrounds.add(background.id);
      await _service.setBGSkins(_backgrounds);
    }

    notifyListeners();
  }

  void onBuyPremium() async {
    _premium = true;
    await _service.setPremium();

    final list = riderSkins.map((e) => e.id).toList();
    final list2 = backgroundSkins.map((e) => e.id).toList();

    _skins = List.from(list);
    _backgrounds = List.from(list2);

    await _service.setSkins(list);
    await _service.setBGSkins(list2);

    notifyListeners();
  }

  void onAddMoney(int coins) async {
    _coins += coins;
    await _service.setCoins(_coins);
    notifyListeners();
  }

  void onUseMoney(int coins) async {
    if(_coins < coins) return;
    _coins -= coins;
    await _service.setCoins(_coins);
    notifyListeners();
  }

  Future<bool> canGetGift() async {
    final date = _service.getLastDate();
    final date2 = DateTime.now();
    final currentDate = DateTime(date2.year, date2.month, date2.day);

    if(date.isAtSameMomentAs(currentDate)) return false;

    await _service.updateLastAction();
    return true;
  }
}
