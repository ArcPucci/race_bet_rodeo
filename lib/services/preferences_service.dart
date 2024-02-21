import 'package:race_bet_rodeo/data/data.dart';
import 'package:race_bet_rodeo/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferences _preferences;

  PreferencesService(this._preferences);

  static const premiumKey = 'PREMIUM';
  static const firstInit = 'FIRST_INIT';
  static const skinsKey = 'SKINS';
  static const bgKey = "BG_KEY";
  static const selectedRiderKey = "SELECTED_RIDER";
  static const selectedBGKey = "SELECTED_BG_KEY";
  static const coinsKey = 'COINS_KEY';
  static const lastDateKey = 'LAST_DATE';

  Future<void> setPremium() async {
    await _preferences.setBool(premiumKey, true);
  }

  bool getPremium() {
    return _preferences.getBool(premiumKey) ?? false;
  }

  Future<void> setBGSkins(List<int> bgIds) async {
    final map = bgIds.map((e) => e.toString()).toList();
    await _preferences.setStringList(bgKey, map);
  }

  List<int> getBGSkins() {
    final map = _preferences.getStringList(bgKey) ?? [];
    if(map.isEmpty) return [];

    final list = map.map((e) => int.parse(e)).toList();
    return list;
  }

  Future<void> setSkins(List<int> skins) async {
    final map = skins.map((e) => e.toString()).toList();
    await _preferences.setStringList(skinsKey, map);
  }

  List<int> getSkins() {
    final map = _preferences.getStringList(skinsKey) ?? [];
    if(map.isEmpty) return [];

    final list = map.map((e) => int.parse(e)).toList();
    return list;
  }

  Future<void> setSkin(int id) async {
    await _preferences.setInt(selectedRiderKey, id);
  }

  Rider getSkin() {
    final id = _preferences.getInt(selectedRiderKey) ?? -1;
    if(id == -1) return Rider.defaultSkin();

    for(final item in riderSkins) {
      if(item.id == id) return item;
    }

    return Rider.defaultSkin();
  }

  Future<void> setBG(int id) async {
    await _preferences.setInt(selectedBGKey, id);
  }

  Background getBG() {
    final id = _preferences.getInt(selectedBGKey) ?? -1;
    if(id == -1) return Background.defaultBG();

    for(final item in backgroundSkins) {
      if(item.id == id) return item;
    }

    return Background.defaultBG();
  }

  Future<void> setCoins(int coins) async {
    await _preferences.setInt(coinsKey, coins);
  }

  int getCoins() {
    return _preferences.getInt(coinsKey) ?? 100;
  }

  Future<void> updateLastAction() async {
    final date = DateTime.now();
    final currentDate = DateTime(date.year, date.month, date.day);
    final temp = currentDate.microsecondsSinceEpoch;

    await _preferences.setInt(lastDateKey, temp);
  }

  DateTime getLastDate() {
    final temp = _preferences.getInt(lastDateKey) ?? 0;

    final date = DateTime.now();
    final currentDate = DateTime(date.year, date.month, date.day);

    if(temp == 0) return currentDate;

    return DateTime.fromMicrosecondsSinceEpoch(temp);
  }
}