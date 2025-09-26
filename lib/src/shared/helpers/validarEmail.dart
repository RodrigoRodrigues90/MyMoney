// ignore_for_file: file_names

bool validarEmail(value){

  const pattern = r'^[\w\.-]+@[\w\.-]+\.com$';
  final regExp = RegExp(pattern);
  return regExp.hasMatch(value);
  
}