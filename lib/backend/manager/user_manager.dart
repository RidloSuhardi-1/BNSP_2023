import '../database/user_crud.dart';

class UserManager {
  static final UserManager instance = UserManager._internal();

  UserManager._internal();

  factory UserManager() {
    return instance;
  }

  Future<bool> resetPassword(
      String username, String passwordLama, String passwordBaru) async {
    var userLama = await UserCRUD().queryUser(username);

    if (userLama != null && userLama.password == passwordLama) {
      userLama.password = passwordBaru;
      int result = await UserCRUD().update(userLama);

      if (result != 0) {
        print('reset password \'${userLama.username}\' berhasil');
        return true;
      }

      return false;
    }
    return false;
  }
}
