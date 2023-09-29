import '../../model/user.dart';
import '../../utils/preferences.dart';
import '../database/user_crud.dart';

class AuthManager {
  static final AuthManager instance = AuthManager._internal();

  AuthManager._internal();

  factory AuthManager() {
    return instance;
  }

  Future<User?> login(User user) async {
    var userdata = await UserCRUD().queryUser(user.username!);

    if (userdata != null && userdata.password == user.password) {
      Preferences().setString('userdata', userdata.username!);
      print('login berhasil: \'user\'');
      return user;
    }

    return null;
  }

  Future<bool> register(User user) async {
    int result = await UserCRUD().save(user);
    print('registrasi pengguna \'${user.username}\' berhasil');
    return result != 0;
  }

  void logout() {
    Preferences().remove('userdata');
  }
}
