import 'package:mymoney/src/modules/registers/Model/registerModel.dart';
import 'package:mymoney/src/modules/registers/services/registerService.dart';

class UserRepository {
  final registerService _userService = registerService();

  Future<void> createUser(register_model user) async {
    await _userService.createUser(user);
  }
}
