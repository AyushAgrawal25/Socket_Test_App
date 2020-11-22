class UserDetails {
  int id;
  String email;
  String firstName;
  String lastName;
  String phoneNumber;
  String gender;
  String profilePicUrl;
  String profilePicThumbnailUrl;
  int loginStatus;
  int status;

  UserDetails.fromMap(Map gpUDMap) {
    if (gpUDMap != null) {
      id = gpUDMap["userId"];
      email = gpUDMap["userEmail"];
      firstName = gpUDMap["userDetailFirstName"];
      lastName = gpUDMap["userDetailLastName"];
      gender = gpUDMap["userDetailGender"];
      loginStatus = gpUDMap["userLogInStatus"];
      phoneNumber = gpUDMap["userDetailPhoneNumber"];
      profilePicUrl = gpUDMap["profilePic"]["userProfilePicUrl"];
      profilePicThumbnailUrl =
          gpUDMap["profilePic"]["userProfilePicThumbnailUrl"];
      status = gpUDMap["userStatus"];
    }
  }
}
