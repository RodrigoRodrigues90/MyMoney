import 'package:mymoney/src/modules/registers/Model/registerModel.dart';

class registerService {
  Future<void> createUser(register_model user) async {
    // Simulate an API call or database operation to create a user
    await Future.delayed(Duration(seconds: 2));
    print('User created: ${user.name}, ${user.email}, ${user.password}');
  }
}