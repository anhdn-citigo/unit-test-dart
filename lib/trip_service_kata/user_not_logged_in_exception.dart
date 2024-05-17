class UserNotLoggedInException implements Exception {
  String cause;
  UserNotLoggedInException([this.cause = "User is not logged in."]);
}