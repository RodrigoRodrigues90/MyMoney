// ignore_for_file: prefer_const_constructors

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mymoney/src/config/appKeys.dart';

class AppSettings{
 static final FlutterSecureStorage  security = FlutterSecureStorage();


static Future<void> saveData(AppKeys key, String value) async{
  await security.write(key: key.toString() ,value: value);
}

static Future<void> deleteData(AppKeys key) async{
  await security.delete(key: key.toString());
}

static Future<String?> getData(AppKeys key) async{
  return await security.read(key: key.toString());
}



}