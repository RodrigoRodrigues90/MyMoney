
import 'package:dio/dio.dart';
import 'package:mymoney/src/modules/personalRegister/model/personalRegisterData_model.dart';
import 'package:mymoney/src/modules/personalRegister/repository/personalRegisterRepository.dart';

import '../../../config/appKeys.dart';
import '../../../config/app_settings.dart';

class PersonalRegisterService{
  PersonalRegisterRepository repository = PersonalRegisterRepository();

  Future<void> sendData({required name, required email, required senha,}) async{

  PersonalRegisterDatamodel dataModel = PersonalRegisterDatamodel(name: name, email: email, password: senha );

    await 
    persistLocalData(await repository.sendPersonalData(dataModel));
  }

    
//==================Flutter Secury Storage - SaveData =======================//
  Future<void> persistLocalData(Response<Map<String, dynamic>> response) async {
    Map<String, dynamic>? result = response.data;

    if (result != null) {
      String token = result['access_token'];
      Map<String, dynamic> userData = result["additional_information"];
      String user_fullName = userData['fullName'];

      AppSettings.deleteData(AppKeys.auth_token);
      AppSettings.deleteData(AppKeys.user);
      AppSettings.deleteData(AppKeys.user_fullName);

      AppSettings.saveData(AppKeys.auth_token, token);
      AppSettings.saveData(AppKeys.user, userData.toString());
      AppSettings.saveData(AppKeys.user_fullName, user_fullName);
    }
  }
///========================================================================///

}