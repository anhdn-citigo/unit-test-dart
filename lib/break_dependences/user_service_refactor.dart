// user_repository.dart
import 'user.dart';

abstract class UserRepository {
  Future<User> findUserById(String userId);
}

// user_service.dart
class UserService {
  final UserRepository userRepository;
  final Session currentSession = Session();

  UserService(this.userRepository);

  Future<User> getUserById(String userId) {
    // Validate permissions
    if (!currentSession.checkPermissions()) {
      throw PermissionDeniedException();
    }
    return userRepository.findUserById(userId);
  }
}


class Session {
  bool checkPermissions() {

    return true;
  }
  
}

class UserStore extends UserRepository {

  @override
  Future<User> findUserById(String userId) {
    /// QUERY USER FROM DB
    return Future.value(User(id: userId, name: 'John Doe'));
  }
}

void main(List<String> args) {
  final userStore = UserStore();
  final userService = UserService(userStore); 

  final user = userService.getUserById('1');

  print(user);
}


class PermissionDeniedException implements Exception {
}