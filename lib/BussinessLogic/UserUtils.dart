import 'package:Socket_Test_App/StateManagement/Models/UserDetails.dart';
import 'package:dio/dio.dart';

String domainName = "http://3.21.53.195:3000";

class UserUtils {
  static Future<UserDetails> fetchUserDetails(
      int userId, String userAccessToken) async {
    String url = domainName + "/appRoute/users/userDetails/$userId";
    Response userDetailsResp = await Dio().get(url,
        options: Options(headers: {"userAccessToken": userAccessToken}));

    print(userDetailsResp.data);

    if (userDetailsResp.data["status"] == 1) {
      return UserDetails.fromMap(userDetailsResp.data["data"]);
    } else {
      return null;
    }
  }
}
