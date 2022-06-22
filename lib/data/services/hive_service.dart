// 🎯 Dart imports:
import 'dart:convert';
import 'dart:ui';

// 📦 Package imports:
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
// 🌎 Project imports:
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/user.dart';

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

  String getLang() {
    return _box.get(_HiveKeys.lang, defaultValue: "uz_UZ");
  }

  void setLang(Locale locale) {
    _box.put(_HiveKeys.lang, locale.toString());
  }

  User? getUser() {
    var user = _box.get(_HiveKeys.user, defaultValue: null);
    if (user != null) {
      return User.fromJson(json.decode(user));
    }
    return user;
  }

  void setUser(User user) {
    _box.put(_HiveKeys.user, json.encode(user.toJson()));
  }

  void deleteUser(User user) {
    _box.delete(_HiveKeys.user);
  }
}

class _HiveKeys {
  static const String lang = "lang";
  static const String user = "user";
}
