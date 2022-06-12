import 'package:glory/data/params/new_user_info.dart';
import 'package:glory/models/user_model.dart';

UserModel formatUserInfo(dynamic info) {
  UserModel user = UserModel.fromJson(info);
  return user;
}

void validateUserInfo(NewUserInfo user) {
  if (user.username.isEmpty) {
    throw "username required";
  }
  if (user.fullname.isEmpty) {
    throw "full name required";
  }
  if (user.phone.isEmpty) {
    throw "phone number required";
  }
  if (user.password.isEmpty) {
    throw "password required";
  }
}

Map<String, dynamic> formatPostData(NewUserInfo user) {
  Map<String, dynamic> data = {
    "username": user.username,
    "email": user.email,
    "fullname": user.fullname,
    "phone": user.phone,
    "password": user.password,
    "profileImage": user.profileImage
  };
  return data;
}

List<UserModel> formatUsers(List<dynamic> data) {
  List<UserModel> users = [];
  for (dynamic user in data) {
    users.add(UserModel.fromJson(user));
  }
  return users;
}


