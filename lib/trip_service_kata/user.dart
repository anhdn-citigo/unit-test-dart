class User {
  String name;
  List<User> friends = <User>[];

  User(this.name, {required List<User> friends});


  void addFriend(User friend) {
    friends.add(friend);
  }
}
