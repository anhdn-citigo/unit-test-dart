// user_repository.dart
abstract class UserRepository {
  Future<User> findUserById(String userId);
}

// user_service.dart
class UserService {
  final UserRepository userRepository;

  UserService(this.userRepository);

  Future<User> getUserById(String userId) {
    return userRepository.findUserById(userId);
  }
}

// user.dart
class User {
  final String id;
  final String name;

  User({required this.id, required this.name});
}
