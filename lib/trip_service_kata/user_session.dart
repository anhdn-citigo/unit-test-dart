
import 'user.dart';

class UserSession {
  static final UserSession instance = UserSession._internal();
  User? loggedUser;

  factory UserSession() {
    return instance;
  }

  UserSession._internal();
}
