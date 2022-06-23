import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/format_userInfo.dart';
import 'package:glory/data/data.dart';
import 'package:glory/data/params/new_user_info.dart';
import 'package:glory/models/user_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/repositories/user_repository.dart';
import 'package:glory/storage/storage.dart';

class UserController extends GetxController {
  final localStorage = LocalStorage();
  final UserRepository userRepository;
  late PlatformFile profileFile;
  late UserModel chatUser;
  late UserModel user = UserModel.fromJson(Data.initialUserInfo);
  late List<UserModel> users = [];
  NewUserInfo info = NewUserInfo();
  bool loading = false;
  bool loggedIn = false;
  String error = "";
  late String message = "";
  Map<String, String> loginParams = {
    "phone": "",
    "password": "",
  };

  UserController({required this.userRepository});

  void handleChatUser(UserModel u) {
    chatUser = u;
    update();
  }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }

  void handleLogin(dynamic data) async {
    print("handling the login request");
    error = "";
    update();
    Response response = await userRepository.postData(Routes.userLogin, data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      localStorage.insertItem("user", response.body);
      user = UserModel.fromJson(response.body);
      update();
    } else {
      error = response.body;
      loading = false;
      update();
    }
  }

  void handleRegister(NewUserInfo data) async {
    try {
      Response response = await userRepository.postData(
          Routes.userRegister, formatPostData(data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        user = UserModel.fromJson(response.body);
        update();
      } else {
        error = response.body.toString();
        update();
      }
    } catch (err) {
      error = err.toString();
      update();
    }
  }

  void handleProfileImage(PlatformFile file) {
    profileFile = file;
    update();
  }

  void getUsers() async {
    try {
      Response response = await userRepository.getUsers(Routes.usersGet);
      if (response.statusCode == 200 || response.statusCode == 201) {
        users = formatUsers(response.body);
        update();
      }
    } catch (err) {
      print(err);
      update();
    }
  }
  //

  void checkUserInfo() async {
    try {
      dynamic userInfo = localStorage.getItem("user");
      if (userInfo != null) {
        user = UserModel.fromJson(userInfo);
        update();
      }
    } catch (err) {
      update();
    }
  }

  //
  //

  void updateUserInfo(dynamic data) async {
    try {
      Response response =
          await userRepository.postData(Routes.updateUserInfo, data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        users = formatUsers(response.body);
        update();
      } else {
        error = response.body;
        update();
      }
    } catch (err) {
      error = err.toString();
      update();
    }
  }

  //
  void phoneVerify(dynamic data) async {
    error = "";
    update();
    try {
      Response response =
          await userRepository.postData(Routes.phoneVerify, data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        user.phone = response.body["phone"];
        user.id = response.body["id"];
        user.authId = response.body["authId"];
        update();
      } else {
        error = response.body;
      }
    } catch (err) {
      error = err.toString();
      update();
    }
  }

  void changePassword(dynamic data) async {
    error = "";
    message = "";
    update();
    try {
      Response response =
          await userRepository.postData(Routes.changePassword, data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        message = response.body;
        update();
      } else {
        error = response.body;
        update();
      }
    } catch (err) {
      error = err.toString();
      update();
    }
  }
}
