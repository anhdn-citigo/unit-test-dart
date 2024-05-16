

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:unit_test_demo/break_dependences/user.dart';
import 'package:unit_test_demo/break_dependences/user_repository.dart';
// Import the generated mock file
import 'user_service_test.mocks.dart';

// Generate a MockUserRepository class
@GenerateMocks([UserRepository])
void main() {
  group('UserService', () {
    late MockUserRepository mockUserRepository;
    late UserService userService;

    setUp(() {
      // Create a mock UserRepository
      mockUserRepository = MockUserRepository();
      // Inject the mock into the UserService
      userService = UserService(mockUserRepository);
    });

    test('getUserById returns the correct user', () async {
      // Create a User object to be returned by the mock
      final mockUser = User(id: '1', name: 'John Doe');

      // Define the behavior of the mock
      when(mockUserRepository.findUserById('1')).thenAnswer((_) async => mockUser);

      // Call the method under test
      final user = await userService.getUserById('1');

      // Assert the results
      expect(user.name, 'John Doe');
    });
  });
}
