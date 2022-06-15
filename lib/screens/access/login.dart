import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:glory/screens/access/register.dart';
import 'package:glory/services/controllers/user_controller.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../homeNavigation/navigation.dart';
import 'forgotPassword.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => UserController(userRepository: Get.find()));
    return GetBuilder<UserController>(builder: (userController) {
      if (userController.user.username.isNotEmpty) {
        return navigation();
      }
      if (userController.loading) {
         context.loaderOverlay.show();

      }
      return LoaderOverlay(
          useDefaultLoading: false,
          overlayColor: Colors.white,
          overlayOpacity: 1,
          overlayWholeScreen: true,
          overlayWidget: const Center(
            child: SpinKitCircle(
              color: Colors.green,
              size: 50.0,
            ),
          ),
          child: Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Theme.of(context).backgroundColor,
                  statusBarBrightness:
                      MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? Brightness.light
                          : Brightness.dark,
                  statusBarIconBrightness:
                      MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Brightness.light
                          : Brightness.dark,
                ),
              ),
              body: SingleChildScrollView(
                  child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(children: [
                  Align(
                    alignment: FractionalOffset.topCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.1,
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Spacer(
                            flex: 10,
                          ),
                          Container(
                            height: 80.0,
                            width: 80.0,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/logo.jpeg'),
                                  fit: BoxFit.fitHeight),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              border:
                                  Border.all(width: 0.5, color: Colors.grey),
                            ),
                          ),
                          // Padding(padding: const EdgeInsets.only(top: 20.0)),
                          const Spacer(
                            flex: 1,
                          ),
                          Text(
                            "Welcome to GLORY",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                    fontSize: 18.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold),
                          ),
                          // Padding(padding: const EdgeInsets.only(top: 10.0)),
                          const Spacer(
                            flex: 1,
                          ),
                          Text(
                            "Sign in to continue",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontSize: 14.0),
                          ),
                          // Padding(padding: const EdgeInsets.only(top: 50.0)),
                          const Spacer(
                            flex: 6,
                          ),
                          TextField(
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                            keyboardType: TextInputType.number,
                            onChanged: (text) {
                              userController.loginParams["phone"] = text;
                            },
                            decoration: InputDecoration(
                              label: Text("Phone Number",
                                  style: Theme.of(context).textTheme.bodyText1),
                              prefixIcon: Icon(Icons.phone_iphone_outlined,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.color),
                            ),
                          ),
                          // Padding(padding: const EdgeInsets.only(top: 30.0)),
                          const Spacer(
                            flex: 1,
                          ),
                          TextField(
                            onChanged: (text) {
                              userController.loginParams["password"] = text;
                            },
                            obscureText: true,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                            decoration: InputDecoration(
                              label: Text("Password",
                                  style: Theme.of(context).textTheme.bodyText1),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color,
                              ),
                            ),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => Get.to(() => forgotPassword()),
                                child: Text(
                                  "Forgot Password?",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                        fontSize: 12.0,
                                      ),
                                ),
                              )
                            ],
                          ),
                          // Padding(padding: const EdgeInsets.only(top: 50.0)),
                          const Spacer(
                            flex: 6,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 40.0,
                              child: ElevatedButton(
                                onPressed: userController.loading
                                    ? null
                                    : () {
                                        userController.handleLogin(
                                            userController.loginParams);
                                        // Get.off(() => navigation())
                                      },
                                child: const Text("Sign In"),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)))),
                              )),
                          // Padding(padding: const EdgeInsets.only(top: 15.0)),
                          const Spacer(
                            flex: 1,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 40.0,
                              child: ElevatedButton.icon(
                                onPressed: () => Get.off(() => navigation()),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)))),
                                label: const Text("Sign In with Apple"),
                                icon: Image.asset(
                                  "assets/images/apple.png",
                                  width: 20.0,
                                  height: 20.0,
                                  color: Colors.black,
                                ),
                              )),
                          // Padding(padding: const EdgeInsets.only(top: 15.0)),
                          const Spacer(
                            flex: 1,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 40.0,
                              child: OutlinedButton(
                                onPressed: () => Get.off(() => navigation()),
                                child: const Text(
                                  "Continue as a Guest",
                                ),
                              )),
                          const SizedBox(height: 10,),
                          Text(userController.error,textAlign: TextAlign.center
                          ,style:const TextStyle(color:Colors.red,)),
                          const Spacer(
                            flex: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        color: Theme.of(context).backgroundColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(fontSize: 14.0),
                            ),
                            InkWell(
                                onTap: () => Get.to(() => const Register()),
                                child: Text(
                                  "Register Now",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Theme.of(context).primaryColor),
                                ))
                          ],
                        )),
                  )
                ]),
              ))));
    });
  }
}
