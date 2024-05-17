import 'trip.dart';
import 'trip_database.dart';
import 'trip_service_original.dart';
import 'user.dart';
import 'user_session.dart';

void main() {
  // Create some users
  User alice = User('Alice');
  User bob = User('Bob');
  User charlie = User('Charlie');

  // Set up friendships
  alice.friends.add(bob);
  bob.friends.add(alice);
  charlie.friends.add(bob);

  // Create some trips
  Trip trip1 = Trip('Paris', DateTime(2023, 5, 1), DateTime(2023, 5, 10));
  Trip trip2 = Trip('New York', DateTime(2023, 6, 15), DateTime(2023, 6, 25));

  // Mock TripDAO to return trips for Alice
  TripDAO.mockTripsForUser(alice, [trip1, trip2]);

  // Set the logged-in user
  UserSession.instance.loggedUser = bob;

  // Create TripService instance
  TripService tripService = TripService();

  // Get trips for Alice
  try {
    List<Trip> trips = tripService.getTripsByUser(alice);
    print('Trips for Alice:');
    for (Trip trip in trips) {
      print('${trip.destination} from ${trip.startDate} to ${trip.endDate}');
    }
  } catch (e) {
    print(e);
  }

  // Get trips for Charlie (should be empty since Bob is not Charlie's friend)
  try {
    List<Trip> trips = tripService.getTripsByUser(charlie);
    print('Trips for Charlie:');
    for (Trip trip in trips) {
      print('${trip.destination} from ${trip.startDate} to ${trip.endDate}');
    }
  } catch (e) {
    print(e);
  }
}
