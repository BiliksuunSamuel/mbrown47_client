import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:glory/screens/subScreens/spin/spinReward.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class spinWheel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).backgroundColor,
          statusBarBrightness: MediaQuery.of(context).platformBrightness == Brightness.light? Brightness.light:Brightness.dark,
          statusBarIconBrightness: MediaQuery.of(context).platformBrightness == Brightness.dark? Brightness.light:Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Theme.of(context).textTheme.bodyText1?.color),
      ),
      body: Stack(
        children: [
          Align(
            alignment: FractionalOffset.topCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              height: MediaQuery.of(context).size.width / 3.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Spin The Wheel!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.yellow.shade700,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10.0)),
                  Text(
                    "Stand a chance to win coupons for your entertainment!",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset.center,
            child: Card(
              shape: const CircleBorder(),
              elevation: 12.0,
              child: Container(
                height: MediaQuery.of(context).size.width / 1.2,
                width: MediaQuery.of(context).size.width / 1.2,
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                decoration:
                    const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: FortuneWheel(
                  items: [
                    FortuneItem(
                        child: const Text('Item'),
                        style: FortuneItemStyle(
                            color: Colors.yellow.shade700,
                            borderWidth: 0.0,
                            textStyle: const TextStyle(color: Colors.white))),
                    FortuneItem(
                        child: const Text('Item'),
                        style: FortuneItemStyle(
                            color: Colors.white,
                            borderWidth: 0.0,
                            textStyle:
                                TextStyle(color: Colors.yellow.shade700))),
                    FortuneItem(
                        child: const Text('Item'),
                        style: FortuneItemStyle(
                            color: Colors.yellow.shade700,
                            borderWidth: 0.0,
                            textStyle: const TextStyle(color: Colors.white))),
                    FortuneItem(
                        child: const Text('Item'),
                        style: FortuneItemStyle(
                            color: Colors.white,
                            borderWidth: 0.0,
                            textStyle:
                                TextStyle(color: Colors.yellow.shade700))),
                    FortuneItem(
                        child: const Text('Item'),
                        style: FortuneItemStyle(
                            color: Colors.yellow.shade700,
                            borderWidth: 0.0,
                            textStyle: const TextStyle(color: Colors.white))),
                    FortuneItem(
                        child: const Text('Item'),
                        style: FortuneItemStyle(
                            color: Colors.white,
                            borderWidth: 0.0,
                            textStyle:
                                TextStyle(color: Colors.yellow.shade700))),
                    FortuneItem(
                        child: const Text('Item'),
                        style: FortuneItemStyle(
                            color: Colors.yellow.shade700,
                            borderWidth: 0.0,
                            textStyle: const TextStyle(color: Colors.white))),
                    FortuneItem(
                        child: const Text('Item'),
                        style: FortuneItemStyle(
                            color: Colors.white,
                            borderWidth: 0.0,
                            textStyle:
                                TextStyle(color: Colors.yellow.shade700))),
                    FortuneItem(
                        child: const Text('Item'),
                        style: FortuneItemStyle(
                            color: Colors.yellow.shade700,
                            borderWidth: 0.0,
                            textStyle: const TextStyle(color: Colors.white))),
                    FortuneItem(
                        child: const Text('Item'),
                        style: FortuneItemStyle(
                            color: Colors.white,
                            borderWidth: 0.0,
                            textStyle:
                                TextStyle(color: Colors.yellow.shade700))),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                margin: const EdgeInsets.only(bottom: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                    onPressed: () {Get.off(()=>spinReward(), fullscreenDialog: true);}, child: const Text("Show Reward"))),
          ),
        ],
      ),
    );
  }
}
