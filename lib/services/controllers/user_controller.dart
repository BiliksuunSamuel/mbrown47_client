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
  final UserRepository userRepository;
  late PlatformFile profileFile;
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

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }

  void handleLogin(dynamic data) async {
    error = "";
    loading = true;
    update();
    Response response = await userRepository.postData(Routes.userLogin, data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      loading = false;
      handleAddItemToStorage(response.body, "user");
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
        error = response.statusText.toString();
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

  void checkUserInfo() {
    try {
      dynamic userInfo = getStorageItem("user");
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
}
