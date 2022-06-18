import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/components/custom_button.dart';
import 'package:glory/components/response_label.dart';
import 'package:glory/services/controllers/user_controller.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
    Get.lazyPut(() => UserController(userRepository: Get.find()));
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(
              color: Theme.of(context).textTheme.bodyText1?.color),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).backgroundColor,
            statusBarBrightness:
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? Brightness.light
                    : Brightness.dark,
            statusBarIconBrightness:
                MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? Brightness.light
                    : Brightness.dark,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Enter Your New Password",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 18.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold)),
              const Padding(padding: EdgeInsets.only(top: 30.0)),
              TextField(
                obscureText: true,
                style: TextStyle(color: Theme.of(context).primaryColor),
                keyboardType: TextInputType.text,
                onChanged: (text) {
                  userController.user.phone = text;
                },
                decoration: InputDecoration(
                  label: Text("New Password",
                      style: Theme.of(context).textTheme.bodyText1),
                  prefixIcon: Icon(
                    Icons.key_outlined,
                    color: Theme.of(context).textTheme.bodyText1?.color,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: true,
                style: TextStyle(color: Theme.of(context).primaryColor),
                keyboardType: TextInputType.visiblePassword,
                onChanged: (text) {
                  userController.user.email = text;
                },
                decoration: InputDecoration(
                  label: Text("Confirm Password",
                      style: Theme.of(context).textTheme.bodyText1),
                  prefixIcon: Icon(
                    Icons.key_outlined,
                    color: Theme.of(context).textTheme.bodyText1?.color,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 30.0)),
              CustomButton(
                  title: "Submit",
                  elevated: true,
                  handlePressed: () {
                    userController.changePassword({
                      "password": userController.user.phone,
                      "confirm_password": userController.user.email,
                      "authId": userController.user.authId
                    });
                  }),
              const SizedBox(
                height: 15,
              ),
              userController.message.isNotEmpty
                  ? ResponseLabel(text: userController.message, isError: false)
                  : Container(),
              userController.error.isNotEmpty
                  ? ResponseLabel(text: userController.error, isError: true)
                  : Container()
            ],
          ),
        ),
      );
    });
  }
}
