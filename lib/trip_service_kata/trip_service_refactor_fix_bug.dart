///
/// Business Rules
/// Imagine a social networking website for travellers:
/// You need to be logged in to see the content
/// You need to be a friend to see someone else's trips
/// If you are not logged in, the code throws an exception
/// 
/// 

import 'trip.dart';
import 'trip_database.dart';
import 'user.dart';
import 'user_not_logged_in_exception.dart';
import 'user_session.dart';

class TripService {
   List<Trip> getTripsByUser(User user) {
    User? loggedUser = getloggedUser();

    bool isFriend = false;

    List<Trip> tripList = [];
    if (loggedUser != null) {
      List<User> friends = loggedUser.friends;
      for (var friend in friends) {
        if (friend.name == user.name) {
          isFriend = true;
          break;
        }
      }

      if (isFriend) {
        tripList = getTripsFromDatabase(user);
      }
            
      return tripList;
    } else {
      throw UserNotLoggedInException();
    }
  }

  User? getloggedUser() {
    return UserSession.instance.loggedUser;
  }

  List<Trip> getTripsFromDatabase(User user) {
     return TripDAO.findTripsByUser(user);
  }
}
