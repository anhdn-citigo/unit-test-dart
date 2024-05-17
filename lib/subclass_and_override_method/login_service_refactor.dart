// FirebaseAuthService interface
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthService {
  Future<ConfirmationResult> signInWithPhoneNumber(String phoneNumber);

  Future<UserCredential> signInWithEmailAndPassword(String email,
     String password,);
}

// FirebaseAuthServiceImpl implements the FirebaseAuthService interface
class FirebaseAuthServiceImpl implements FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<ConfirmationResult> signInWithPhoneNumber(String phoneNumber) {
    return _firebaseAuth.signInWithPhoneNumber(phoneNumber);
  }
  
  @override
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) {

    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  
}

// Refactored LoginService
class LoginService {
  final FirebaseAuthService _firebaseAuthService;

  LoginService(this._firebaseAuthService);

  Future<ConfirmationResult> loginWithMobileNumber(String mobileNumber) async {
    // Validate mobile number
    if (!_isValidMobileNumber(mobileNumber)) {
      throw Exception('Invalid mobile number');
    }

    // Authenticate with Firebase using mobile number
    ConfirmationResult confirm = await _firebaseAuthService.signInWithPhoneNumber(mobileNumber);

    return confirm;
  }

  Future<UserCredential> loginWithEmailPassword(
      String email, String password) async {
    // Validate email and password
    if (!_isValidEmail(email) || !_isValidPassword(password)) {
      throw Exception('Invalid email or password');
    }

    // Authenticate with Firebase using email and password
        
    try {
      UserCredential user = await _firebaseAuthService.signInWithEmailAndPassword(email, password);
      return user;
    } catch (e) {
      throw  Exception('Invalid email or password');

    }


  }

  bool _isValidMobileNumber(String mobileNumber) {
    // Mobile number validation logic
    return mobileNumber == "validNumber";
  }

  bool _isValidEmail(String email) {
    // Email validation logic
    return email == "valid@email.com";
  }

  bool _isValidPassword(String password) {
    // Password validation logic
    return password == "validPassword";
  }
}
