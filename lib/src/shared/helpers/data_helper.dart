import 'package:intl/intl.dart';

class DateHelper {
  static String getFormatDMY(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  static String getDayOfMonth() {
    final DateFormat formatter = DateFormat('dd');
    return formatter.format(DateTime.now());
  }
  static String getFormatData(DateTime data){
    final DateFormat formatter = DateFormat('yyyy-MM-dd\'T\'HH:mm:ss\'Z\'');
    return formatter.format(data);
  }
  
  static String getFormatDataFromString(String data){
    final DateTime dataTime = DateTime.parse(data);
    String dataString = getFormatDMY(dataTime);
    return dataString;
  }

}