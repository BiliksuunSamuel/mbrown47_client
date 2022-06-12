import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/screens/access/welcome.dart';
import 'package:glory/screens/homeNavigation/navigation.dart';
import 'package:glory/services/controllers/user_controller.dart';

class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      userController.checkUserInfo();
      return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
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
          body: Stack(
            children: [
              Align(
                alignment: FractionalOffset.center,
                child: AnimatedSplashScreen(
                  splash: Card(
                    color: Colors.transparent,
                    elevation: 20.0,
                    shadowColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Container(
                      width: 180.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2.0),
                          image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/logo.jpeg',
                              ),
                              fit: BoxFit.fitHeight)),
                    ),
                  ),
                  nextScreen:
                      userController.user.username.isNotEmpty ? navigation() : welcome(),
                  splashTransition: SplashTransition.fadeTransition,
                  splashIconSize: 180.0,
                  centered: true,
                  animationDuration: const Duration(milliseconds: 800),
                  duration: 1500,
                  backgroundColor: Theme.of(context).backgroundColor,
                ),
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: Text("GLORY",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 30.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold))),
              )
            ],
          ));
    });
  }
}
