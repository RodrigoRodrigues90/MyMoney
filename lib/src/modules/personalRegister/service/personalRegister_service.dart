import 'package:flutter/material.dart';
import 'package:mymoney/src/config/appKeys.dart';
import 'package:mymoney/src/config/app_settings.dart';
import '../../../shared/helpers/autenticated_user.dart';
import '../../../shared/models/user_model.dart';
import '../../../shared/models/user_update_model.dart';
import '../model/personalRegisterData_model.dart';
import '../repository/personalRegisterRepository.dart';

class PersonalRegisterService {
  PersonalRegisterRepository repository = PersonalRegisterRepository();

  Future<bool> sendData({
    required String name,
    required String email,
    required double limitValue,
  }) async {
    try {
      UserModel user = await AuthenticatedUser.getUserData();

      if (name.compareTo(user.fullName) != 0 ||
          email.compareTo(user.email) != 0) {
        AppSettings.saveData(AppKeys.user_fullName, name);
        AppSettings.saveData(AppKeys.user_email, email);

        await updateRegister(
          user.id,
          UserUpdateModel(
            fullName: name,
            email: email,
          ),
        );
      }

      if (limitValue != user.limitValue) {
        await sendPersonalRegister(limitValue, user.id);
      }

      return true;
    } catch (expetion) {
      debugPrint(expetion.toString());
      return false;
    }
  }

  Future<void> sendPersonalRegister(double limitValue, String userId) async {
    await repository.sendData(PersonalRegisterModel(
      userId: userId,
      limitValue: limitValue,
    ));
  }

  Future<void> updateRegister(String userId, UserUpdateModel userUpdate) async {
    await repository.updateDataUser(userId, userUpdate);
  }
}
