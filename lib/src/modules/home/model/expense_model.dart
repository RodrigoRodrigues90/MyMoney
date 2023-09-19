
import 'package:mymoney/src/shared/helpers/data_helper.dart';

import '../../../shared/models/user_conect_model.dart';

class ExpenseModel{
late String category;
late String description;
late double value;
late String registrationDate;

ExpenseModel({
  required this.category,
  required this.description,
  required this.value,
  required this.registrationDate,
});

ExpenseModel.fromJson(Map<String,dynamic> json){
  category = json["category"];
  description = json["description"];
  value = json["value"].toDouble();
  registrationDate = DateHelper.getFormatDataFromString(json["registrationDate"]);
}

Map<String, dynamic> toJson(String? userId) {
    final Map<String, dynamic> data = <String, dynamic>{};

    Map<String, dynamic> userConnect =
    UserConnectModel(userId: userId!).toJson();
    data["user"] = userConnect;
    data["category"] = category;
    data["description"] = description;
    data["value"] = value.toDouble();
    data["registrationDate"] = registrationDate;
    print(userConnect);
    return data;
  }

Map<String, dynamic> toJsonUpdate() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["category"] = category;
    data["description"] = description;
    data["value"] = value;
    data["registrationDate"] = DateTime.parse(registrationDate);

    return data;
  }

}