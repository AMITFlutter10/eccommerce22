import 'package:ecommerce22/view/utilities/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCache {
  static SharedPreferences? preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void putString(
      {required MyCacheKeys key, required String value}) async {
    await preferences?.setString(key.name, value);
  }

  static String getString({required MyCacheKeys key,}) {
    return preferences?.getString(key.name,) ?? '';
  }

  static void putBoolean(
      {required MyCacheKeys key, required bool value}) async {
    await preferences?.setBool(key.name, value);
  }

  static bool getBoolean({required MyCacheKeys key,}) {
    return preferences?.getBool(key.name,) ?? false;
  }

  static void putInt({required MyCacheKeys key, required int value}) async {
    await preferences?.setInt(key.name, value);
  }

  static int getInt({required MyCacheKeys key,}) {
    return preferences?.getInt(key.name,) ?? 0;
  }

  static void putDouble(
      {required MyCacheKeys key, required double value}) async {
    await preferences?.setDouble(key.name, value);
  }

  static double getDouble({required MyCacheKeys key,}) {
    return preferences?.getDouble(key.name,) ?? 0.0;
  }

  static Future<void> removeFromShared({required MyCacheKeys key,}) async {
    await preferences?.remove(key.name);
  } static Future<bool> saveDataToSP(
      {required MyCacheKeys key, required dynamic value}) async {
    if (value is bool) {
      return await preferences!.setBool(key.name, value);
    } else if (value is String) {
      return await preferences!.setString(key.name, value);
    } else if (value is double) {
      return await preferences!.setDouble(key.name, value.toDouble());
    } else if (value is int) {
      return await preferences!.setInt(key.name, value);
    } else {
      value ??= 0;
      return await preferences!.setDouble(key.name, value.toDouble());
    }
  }





  static Future<void> clearShared() async {
    await preferences?.clear();
  }
}