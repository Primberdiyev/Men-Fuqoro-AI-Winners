import 'package:hive/hive.dart';
import 'package:men_fuqoro_ai/features/main/models/user_model.dart';

class HiveServices {
  Future<void> saveUser(UserModel user) async {
    final box = Hive.box<UserModel>('userBox');
    await box.put('currentUser', user);
  }

  UserModel? getUser() {
    final box = Hive.box<UserModel>('userBox');
    return box.get('currentUser');
  }

  Future<void> deleteUser() async {
    final box = Hive.box<UserModel>('userBox');
    await box.delete('currentUser');
  }
}
