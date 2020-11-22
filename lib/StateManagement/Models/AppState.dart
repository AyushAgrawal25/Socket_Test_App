import 'package:Socket_Test_App/StateManagement/Models/UserDetails.dart';
import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier {
  UserDetails userDetails;
  void setUserDetails(UserDetails gpUserDetails) {
    userDetails = gpUserDetails;
    notifyListeners();
  }
}
