import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtil{
  SharedPreferences? sharedPreferences;
  SharedPrefUtil(){
    init();
  }
   Future init()async{
    sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences;
  }
  
  Future<void> setBool({required String key , required bool value})async
  {
    await sharedPreferences?.setBool(key, value);
  }
  bool? getBool({required String key}){
    return  sharedPreferences?.getBool(key);
  }

  Future<void> setString({required String key , required String value}) async{
    await sharedPreferences?.setString(key, value);
    }
  String? getString({required String key}){
    return  sharedPreferences?.getString(key);
  }


}