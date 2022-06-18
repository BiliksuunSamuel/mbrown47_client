import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/screens/homeNavigation/navigation.dart';
import 'package:glory/services/controllers/user_controller.dart';

import 'login.dart';

class welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      if (userController.user.username.isNotEmpty) {
        navigation();
      }
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        extendBodyBehindAppBar: true,
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
        body: Center(
          child: Stack(children: [
            Align(
              alignment: FractionalOffset.center,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Stack(
                          children: [
                            Align(
                              alignment: FractionalOffset.center,
                              child: Transform.rotate(
                                  angle: -8 * pi / 180,
                                  child: Container(
                                    width: 213.28,
                                    height: 291.85,
                                    color: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.light
                                        ? Theme.of(context).primaryColor
                                        : const Color(0xFF406752),
                                  )),
                            ),
                            Align(
                                alignment: FractionalOffset.center,
                                child: Image.asset(
                                  'assets/images/curved_line.png',
                                  color: MediaQuery.of(context)
                                              .platformBrightness ==
                                          Brightness.light
                                      ? Theme.of(context).primaryColor
                                      : const Color(0xFF406752),
                                  width: MediaQuery.of(context).size.width,
                                )),
                            Align(
                              alignment: FractionalOffset.center,
                              child: Card(
                                color: Colors.transparent,
                                elevation: 12.0,
                                child: Image.asset(
                                  "assets/images/welcome.png",
                                  width: 213.28,
                                  height: 291.85,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Experience Social Media\n",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                      fontSize: 18.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text: "Your Way With ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        fontSize: 20.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "Glory World",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold)),
                          ]),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Use social media your way and let your followers use it their way."
                          " You can have the experience you want without ever using another"
                          " app, at anytime.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontSize: 12.0),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 30.0),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.only(bottom: 50.0),
                      // )
                    ]),
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 40.0,
                margin: const EdgeInsets.only(bottom: 20.0),
                child: ElevatedButton(
                  onPressed: () => Get.off(const Login()),
                  child: const Text("Get Started"),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                        const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins')),
                  ),
                ),
              ),
            )
          ]),
        ),
      );
    });
  }
}
