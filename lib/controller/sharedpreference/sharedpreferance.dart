import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferance {
  static Future<SharedPreferences> get _instance async =>
      pref ??= await SharedPreferences.getInstance();
  static SharedPreferences? pref;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    pref = await _instance;
    debugPrint("SHARED PREFERENCE INIT");
    return pref!;
  }

  static Future<bool> save(
      {required String key, required dynamic value}) async {
    if (pref == null) await init();
    switch (value.runtimeType) {
      case const (String):
        return pref!.setString(key, value);
      case const (bool):
        return pref!.setBool(key, value);
      case const (int):
        return pref!.setInt(key, value);
      case const (double):
        return pref!.setDouble(key, value);
      default:
        return pref!.setString(key, jsonEncode(value));
    }
  }



 
  static clear() {
    init();
    pref?.clear();
  }
  static getint(key) async {
    await init();
    int? value = pref!.getInt(key);
    return value;
  }
  static getstring(key) async {
    await init();
    String? value = pref!.getString(key);
    return value;
  }
  static getbool(key) async {
    await init();
    bool? value = pref!.getBool(key);
    return value;
  }

}