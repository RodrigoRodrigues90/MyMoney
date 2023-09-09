import 'package:mymoney/src/config/appKeys.dart';
import 'package:mymoney/src/config/app_settings.dart';

import '../models/user_model.dart';

class AuthenticatedUser {
  static Future<UserModel> getUserData() async {
    UserModel userData = UserModel(
        fullName: AppSettings.getData(AppKeys.user_fullName).toString(),
        email: AppSettings.getData(AppKeys.user_email).toString(),
        id: AppSettings.getData(AppKeys.user_id).toString());

    return userData;
  }
}