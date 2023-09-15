import 'dart:convert';
import 'package:mymoney/src/config/app_settings.dart';

import '../../config/appKeys.dart';
import '../models/user_model.dart';

class AuthenticatedUser {
  static Future<UserModel> getUserData() async {
    Map<String, dynamic> userJson = {};

    String? user = await AppSettings.getData(AppKeys.user);

    if (user != null) userJson.addAll(jsonDecode(user));

    String goalValue =
        await AppSettings.getData(AppKeys.goal_value) ?? "0";

    userJson["limitValue"] = goalValue;

    UserModel userData = UserModel.fromJson(userJson);

    return userData;
  }
}