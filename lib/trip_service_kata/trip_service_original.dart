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
    User? loggedUser = UserSession.instance.loggedUser;
    bool isFriend = false;
    List<Trip> tripList = [];

    if (loggedUser != null) {
      for (var friend in loggedUser.friends) {
        if (friend == loggedUser) {
          isFriend = true;
          break;
        }
      }

      if (isFriend) {
        tripList = TripDAO.findTripsByUser(user);
      }
            
      return tripList;
    } else {
      throw UserNotLoggedInException();
    }

  }
}
