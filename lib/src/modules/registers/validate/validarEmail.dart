// ignore_for_file: file_names

bool validarEmail(value){

  final pattern = r'^[\w\.-]+@[\w\.-]+\.com$';
  final regExp = RegExp(pattern);
  return regExp.hasMatch(value);
  
}