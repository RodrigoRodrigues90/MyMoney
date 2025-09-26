import '../../../shared/models/user_conect_model.dart';

class PersonalRegisterModel {
  late  String userId;
  late double limitValue;

  PersonalRegisterModel({
    required this.userId,
    required this.limitValue,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    Map<String, dynamic> userConnect =
        UserConnectModel(userId: userId).toJson();

    data["user"] = userConnect;
    data["limitValue"] = limitValue;

    return data;
  }

  PersonalRegisterModel.fromJson(Map<String , dynamic> json){
    limitValue = json["limitValue"];
    userId = json['userId'];

  }
}