import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveIfNotFirstTime() async {
    return await prefs.setBool('is First Time', false);
  }

  static bool getIfFirstTime() {
    return prefs.getBool('is First Time') ?? true;
  }

  static Future<bool> saveToken(String id) async {
    return await prefs.setString('token', id);
  }

  static String getToken() {
    return prefs.getString('token') ?? '';
  }

  static Future<bool> clear() {
    return prefs.clear();
  }
}
