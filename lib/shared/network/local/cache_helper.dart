import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{

  static SharedPreferences? sharedPreferences;

  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
    required String kye,
    required bool value,
})async
  {
    return await sharedPreferences!.setBool(kye,value);
  }

  static bool? getBoolean({
    required String kye,
  })
  {
    return sharedPreferences!.getBool(kye);
  }
}