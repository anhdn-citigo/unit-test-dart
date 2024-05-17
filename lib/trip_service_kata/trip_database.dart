
import 'trip.dart';
import 'user.dart';

class TripDAO {
  static final Map<User, List<Trip>> _tripsByUser = {};

  static List<Trip> findTripsByUser(User user) {
    return _tripsByUser[user] ?? [];
  }

  static void mockTripsForUser(User user, List<Trip> trips) {
    _tripsByUser[user] = trips;
  }
}