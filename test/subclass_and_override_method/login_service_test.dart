// Mock implementation of FirebaseAuthService


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:mockito/mockito.dart';

import 'package:unit_test_demo/irritating_class/login_service_refactor.dart';

void main() {
  
  
  setUpAll(() async {
      setupFirebaseAuthMocks();
    
  });
  group('LoginService', () {
   

    test('loginWithMobileNumber should validate input', () async {
      final mockFirebaseAuthService = MockFirebaseAuthService();
      final loginService = LoginService(mockFirebaseAuthService);

      // Test invalid mobile number
      expect(
        () => loginService.loginWithMobileNumber('invalidNumber'),
        throwsException,
      );

      // Test valid mobile number
      final result = await loginService.loginWithMobileNumber('validNumber');
      expect(result, isA<ConfirmationResult>());
    });

    test('loginWithEmailPassword should validate input', () async {
      final mockFirebaseAuthService = MockFirebaseAuthService();
      final loginService = LoginService(mockFirebaseAuthService);

      // Test invalid email or password
      expect(
        () => loginService.loginWithEmailPassword('invalid@email.com', 'pass'),
        throwsException,
      );

      // Test valid email and password
      final result =
          await loginService.loginWithEmailPassword('valid@email.com', 'validPassword');
      expect(result, isA<UserCredential>());
    });
  });

  
}

class MockFirebaseAuthService implements FirebaseAuthService {

  @override
  Future<ConfirmationResult> signInWithPhoneNumber(String phoneNumber) {
    // Implement mock behavior for signInWithPhoneNumber
    return Future.value(FakeConfirmationResult());
  }
  
  @override
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) {
    // Implement mock behavior for signInWithEmailAndPassword
     return Future.value(MockUserCredential());
  }
  
}


class MockUserCredential extends Mock implements UserCredential { }

class FakeConfirmationResult  implements ConfirmationResult {
  @override
  Future<UserCredential> confirm(String verificationCode) {

    return Future.value(MockUserCredential());
  }

  @override
  String get verificationId => "1";
}
typedef Callback = void Function(MethodCall call);

void setupFirebaseAuthMocks([Callback? customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();

  MockFirebaseApp;
}

Future<T> neverEndingFuture<T>() async {
  // ignore: literal_only_boolean_expressions
  while (true) {
    await Future.delayed(const Duration(minutes: 5));
  }
}

