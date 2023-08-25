bool validarEmail(value){

  // implementar validação de email
  if(!value.contains("@") ||
  !value.contains(".com") ||
  value.length < 5){
    return false;
  }else{
    return true;
  }
}