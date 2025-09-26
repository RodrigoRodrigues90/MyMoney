// ignore_for_file: file_names, camel_case_types

class loginDatamodel {
  String username;
  String password;

  loginDatamodel({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["username"] = username;
    data["password"] = password;

    return data;
  }
}
