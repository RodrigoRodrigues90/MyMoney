class PersonalRegisterDatamodel {
  
  String name;
  String email;
  String password;

  PersonalRegisterDatamodel({
    required this.name,
    required this.email,
    required this.password,

  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = name;
    data['email'] = email;
    data['password'] = password;

    return data;
  }

}