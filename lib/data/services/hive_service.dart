// 🎯 Dart imports:
import 'dart:convert';
import 'dart:ui';

// 📦 Package imports:
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
// 🌎 Project imports:
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/auth_model/login_end_model.dart';
import 'package:najot/data/model/auth_model/user.dart';

class HiveService {
  late Box _box;
  static Future init() async {
    final getIt = GetIt.instance;

    getIt.registerSingleton<HiveService>(HiveService());
    await getIt<HiveService>().create();
  }

  static HiveService get to => GetIt.I<HiveService>();

  Future create() async {
    _box = await Hive.openBox(LocaleKeys.app_name);
  }

  Future setIsUpdateAvailableActive(bool value) async {
    await _box.put("isUAactive", value);
  }

  bool getIsUpdateAvailableActive() {
    return _box.get("isUAactive");
  }

  String getLang() {
    return _box.get(_HiveKeys.LANG, defaultValue: "uz_UZ");
  }

  void setLang(Locale locale) {
    _box.put(_HiveKeys.LANG, locale.toString());
  }

  User? getUser() {
    var user = _box.get(_HiveKeys.USER, defaultValue: null);
    if (user != null) {
      return User.fromJson(json.decode(user));
    }
    return user;
  }

  void setUser(User user) {
    _box.put(_HiveKeys.USER, json.encode(user.toJson()));
  }

  void deleteUser(User user) {
    _box.delete(_HiveKeys.USER);
  }

  //token
  void setToken(LoginEndModel loginEndModel) {
    _box.put(_HiveKeys.TOKEN, json.encode(loginEndModel.toJson()));
  }

  LoginEndModel? getToken() {
    var user = _box.get(_HiveKeys.TOKEN, defaultValue: null);
    if (user != null) {
      return LoginEndModel.fromJson(json.decode(user));
    }
    return user;
  }

  void deleteToken() {
    _box.delete(_HiveKeys.TOKEN);
  }
}

class _HiveKeys {
  static const String LANG = "lang";
  static const String USER = "user";
  static const String TOKEN = 'token';
}
