
import 'user.dart';

class UserStore {
  Future<User> findUserById(String userId) {
    /// QUERY USER FROM DB
    return Future.value(User(id: userId, name: 'John Doe'));
  }
}

class UserService {

  Future<User> getUserById(String userId) {
    return UserStore().findUserById(userId);
  }
}
