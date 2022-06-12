class UserModel {
  late String fullname;
  late String username;
  late String email;
  late String phone;
  late String status;
  late List<dynamic> followers ;
  late String profileImage;
  late String dateCreated;
  late String authId ;
  late String id;
  late int role;

  UserModel.fromJson(Map<String,dynamic>info){
    username = info["username"];
    authId = info["authId"];
    role = info["role"];
    dateCreated = info["dateCreated"];
    fullname = info["fullname"];
    email = info["email"];
    followers = info["followers"] as List<dynamic>;
    id = info["_id"];
    profileImage = info["profileImage"];
    phone = info["phone"];
    status = info["status"];
  }
}
