import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:glory/screens/access/splash.dart';
import 'package:glory/services/controllers/books_controller.dart';
import 'package:glory/services/controllers/event_controller.dart';
import 'package:glory/services/controllers/movies_controller.dart';
import 'package:glory/services/controllers/songs_controller.dart';
import 'package:glory/services/controllers/story_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';
import 'package:glory/services/root/root.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController(userRepository: Get.find()).getUsers();
    return GetMaterialApp(
      title: "Glory",
      home: LoaderOverlay(
        overlayWholeScreen: true,
          useDefaultLoading: false,
          overlayColor: Colors.white,
          overlayOpacity: 0.75,
          overlayWidget: const SpinKitCircle(
            color: Colors.green,
            size: 50,
          ),
        child: splash()),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
          canvasColor: Colors.grey.shade900,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.grey.shade900,
            unselectedItemColor: Colors.grey,
            selectedItemColor: appPrimary,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.shifting,
            unselectedIconTheme: const IconThemeData(size: 20.0),
            selectedIconTheme: const IconThemeData(
              size: 24.0,
            ),
          ),
          textTheme: const TextTheme(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.grey)),
          fontFamily: 'Poppins',
          backgroundColor: Colors.black,
          primarySwatch: appPrimary,
          primaryColor: appPrimary,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(4.0),
                  shadowColor: MaterialStateProperty.all(appPrimary),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(appPrimary),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold)))),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(width: 1.0, color: appPrimary)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
                  textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                      fontFamily: 'Poppins',
                      color: appPrimary,
                      fontWeight: FontWeight.bold)))),
          inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            isDense: true,
            contentPadding: EdgeInsets.all(0.0),
          )),
      theme: ThemeData(
          canvasColor: Colors.white,
          textTheme: const TextTheme(
              bodyText1: TextStyle(color: Colors.black),
              bodyText2: TextStyle(color: Colors.grey)),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.black,
            selectedItemColor: appPrimary,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.shifting,
            unselectedIconTheme: const IconThemeData(size: 20.0),
            selectedIconTheme: const IconThemeData(
              size: 24.0,
            ),
          ),
          fontFamily: 'Poppins',
          backgroundColor: Colors.white,
          primarySwatch: appPrimary,
          primaryColor: appPrimary,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(4.0),
                  shadowColor: MaterialStateProperty.all(appPrimary),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(appPrimary),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold)))),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(width: 1.0, color: appPrimary)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
                  textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                      fontFamily: 'Poppins',
                      color: appPrimary,
                      fontWeight: FontWeight.bold)))),
          inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            isDense: true,
            contentPadding: EdgeInsets.all(0.0),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}

MaterialColor appPrimary = const MaterialColor(0xFF81DDAA, <int, Color>{
  50: Color.fromRGBO(129, 221, 170, 1),
  100: Color.fromRGBO(129, 221, 170, 1),
  200: Color.fromRGBO(129, 221, 170, 1),
  300: Color.fromRGBO(129, 221, 170, 1),
  400: Color.fromRGBO(129, 221, 170, 1),
  500: Color.fromRGBO(129, 221, 170, 1),
  600: Color.fromRGBO(129, 221, 170, 1),
  700: Color.fromRGBO(129, 221, 170, 1),
  800: Color.fromRGBO(129, 221, 170, 1),
  900: Color.fromRGBO(129, 221, 170, 1),
});



//18,
//12,