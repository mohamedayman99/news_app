import 'package:shared_preferences/shared_preferences.dart';

class CashHelper{
static late  SharedPreferences prefs;
static Future<void> init()async{
  prefs=await SharedPreferences.getInstance();
}
static Future<bool> setBool({required String key,required bool value})async{
  return await prefs.setBool(key, value);

}
static getData(String key){
  return prefs.get(key);
}
}