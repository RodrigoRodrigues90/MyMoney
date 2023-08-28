import 'package:shared_preferences/shared_preferences.dart';

class AppSettings{
static String fullname = "fullName";
static String tokenUser = "tokenUser";

static void save(String name, String token) async{
  var _prefs = await SharedPreferences.getInstance();
  _prefs.setString(fullname, name);
  _prefs.setString(tokenUser, token);
}

static Future<String> get() async{
  var _prefs = await SharedPreferences.getInstance();
  var string = _prefs.getString(fullname).toString();
  String _prefsStringFullName = string; 
  
  print(_prefsStringFullName);
  return _prefsStringFullName;
}

}