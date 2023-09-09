import 'package:dio/dio.dart';

import '../../../http/app_dio.dart';

class HomeRepository{

  Future<Response<List<dynamic>>> getExpenses(String userId) async{
    String URL = "http://192.168.15.72:3099/expense/findAllByUser/$userId";
    Dio clientHTTP = await AppDio.getConnection(isAuth: true);

    return await clientHTTP.get(URL);
  }


  Future<Response<Map<String, dynamic>>> getGoal(String userId) async{
    String URL = "http://192.168.15.72:3099/goal/findByUser/$userId";
    Dio clientHTTP = await AppDio.getConnection(isAuth: true);

    return await clientHTTP.get(URL);
  }

}