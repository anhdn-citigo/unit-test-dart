
import 'package:test/test.dart';
import 'package:unit_test_demo/trip_service_kata/trip.dart';
import 'package:unit_test_demo/trip_service_kata/trip_service_refactor_fix_bug.dart';
import 'package:unit_test_demo/trip_service_kata/user.dart';
import 'package:unit_test_demo/trip_service_kata/user_not_logged_in_exception.dart';

void main() {

  group('Trip service', () {
    

    late User friend;
    late UserBuilder friendBuilder;

    TripService setupLoggedInUser() {
      friend = User('tuan', friends: []);
      friendBuilder = UserBuilder(name: "tung").addFriend(friend);
      var loggedUser =  friendBuilder.build();
      TestableTripService tripService = TestableTripService(loggedUser);
      return tripService;
    }

    TripService setupUnLoggedInUser() {
      TestableTripService tripService = TestableTripService(null);
      return tripService;
    }


    test('validate the user not logged in sholud throw an exception', () async {
      User user = User('alice', friends: []);
      TripService tripService = setupUnLoggedInUser();

      expect(() => tripService.getTripsByUser(user),
       throwsA(isA<UserNotLoggedInException>()),);
    });


    test('return no trip if users are not friend', () async {
      User stranger = User('anh', friends: []);
      TripService tripService = setupLoggedInUser();
      
      expect(tripService.getTripsByUser(stranger).isEmpty, true);
    });

    test('return trip if users are friend', () async {
      TripService tripService = setupLoggedInUser();
      
      expect(tripService.getTripsByUser(friend).isNotEmpty, true);
      expect(tripService.getTripsByUser(friend).length, 2);

    });

   
  });

}


class TestableTripService extends TripService {
  User? loggedUser;

  TestableTripService(this.loggedUser);

  @override
  User? getloggedUser() {
    return loggedUser;
  }

  @override
  getTripsFromDatabase(User user) {
    Trip trip = Trip("Hanoi", DateTime.now(), DateTime.now());
    Trip trip2 = Trip("Cameron", DateTime.now(), DateTime.now());
    return [trip,trip2];
  }

}

// UserBuilder is follow factory class design pattern
class UserBuilder {
  String name;
  List<User> friends = <User>[];
  
  UserBuilder({required this.name});

  User build() {
    return User(name, friends: friends);
  }

  UserBuilder addFriend(User user) {
    friends.add(user);
    return this;
  } 

  UserBuilder removeFriend(User user) {
    friends.remove(user);
    return this;
  }

}