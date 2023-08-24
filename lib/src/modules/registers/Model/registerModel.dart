// ignore_for_file: file_names, camel_case_types

class registerDatamodel {

  String name;
  String email;
  String password;
  String roles;

  registerDatamodel(
      {required this.name,
      required this.email,
      required this.password,
      this.roles = "user"});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = name;
    data['email'] = email;
    data['password'] = password;
    data['roles'] = roles;

    return data;
  }
}
