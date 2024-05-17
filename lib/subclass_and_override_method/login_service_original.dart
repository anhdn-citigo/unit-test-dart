// Original LoginService class
import 'package:firebase_auth/firebase_auth.dart';

class LoginService {


  Future<bool> loginWithMobileNumber(String mobileNumber) async {
    // Validate mobile number
    if (!_isValidMobileNumber(mobileNumber)) {
      throw Exception('Invalid mobile number');
    }

    // Authenticate with Firebase using mobile number
    ConfirmationResult confirm = await FirebaseAuth.instance.signInWithPhoneNumber(mobileNumber);
    return confirm.verificationId.isNotEmpty;
  }

  Future<bool> loginWithEmailPassword(
      String email, String password) async {
    // Validate email and password
    if (!_isValidEmail(email) || !_isValidPassword(password)) {
      throw Exception('Invalid email or password');
    }

    // Authenticate with Firebase using email and password
    try {
      UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }

  }

  bool _isValidMobileNumber(String mobileNumber) {
    // Mobile number validation logic
    return true;
  }

  bool _isValidEmail(String email) {
    // Email validation logic
    return true;
  }

  bool _isValidPassword(String password) {
    // Password validation logic
    return true;
  }
}
