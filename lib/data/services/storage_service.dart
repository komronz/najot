import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

class StorageService {
  late final Box _box;

  static StorageService get to => GetIt.I<StorageService>();

  static Future<void> init() async {
    GetIt.instance.registerSingleton<StorageService>(StorageService());
    await GetIt.I<StorageService>().create();
  }

  Future<void> create() async {
    _box = await Hive.openBox('app');
  }

  Locale getLocale() {
    List<String> value =
        (_box.get(_StorageKeys.locale, defaultValue: 'uz_UZ') as String)
            .split("_");

    return Locale(value.first, value.last);
  }

  Future<void> setLocale(Locale locale) async {
    await _box.put(_StorageKeys.locale, locale.toString());
  }

  Future<void> setThemeMode(ThemeMode value) async {
    await _box.put(_StorageKeys.themeMode, value);
  }

  ThemeMode getThemeMode() {
    return _box.get(_StorageKeys.themeMode, defaultValue: ThemeMode.light);
  }

  Future<void> setAccessToken(String value) async {
    await _box.put(_StorageKeys.accessToken, value);
  }

  String getAccessToken() {
    return _box.get(_StorageKeys.accessToken, defaultValue: "");
  }

  Future<void> setSignedIn(bool value) {
    return _box.put(_StorageKeys.signedIn, value);
  }

  bool getSignedIn() {
    return _box.get(_StorageKeys.signedIn, defaultValue: false);
  }

  Future<void> setCourseId(int value) async {
    return _box.put(_StorageKeys.courseId, value);
  }

  int getCourseId() {
    return _box.get(_StorageKeys.courseId, defaultValue: -1);
  }

  Future<void> setLevelId(int value) async {
    return _box.put(_StorageKeys.levelId, value);
  }

  int getLevelId() {
    return _box.get(_StorageKeys.levelId, defaultValue: -1);
  }

  Future clearAll() async {
    await _box.clear();
  }

  void setFCMToken(String token) {
    _box.put(_StorageKeys.fcmToken, token);
  }

  String getFCMToken() {
    return _box.get(_StorageKeys.fcmToken, defaultValue: "");
  }
}

class _StorageKeys {
  static const locale = 'locale';
  static const themeMode = 'theme_mode';
  static const accessToken = 'access_token';
  static const signedIn = 'signed_in';
  static const courseId = 'course_id';
  static const levelId = 'level_id';
  static const fcmToken = 'fcm_token';
}
