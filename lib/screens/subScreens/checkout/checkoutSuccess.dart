import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class checkoutSuccess extends StatelessWidget{


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
        iconTheme: IconThemeData(
            color: Theme.of(context).textTheme.bodyText1?.color
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              "Payment Successful!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1?.copyWith( fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            SizedBox(
                width: MediaQuery.of(context).size.width/1.2,
                child: Image.asset('assets/images/payment_successful.png'),
              ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                margin: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                    onPressed: () {Get.back();}, child: const Text("Explore More"))),
          ],
        ),
      ),

    );
  }

}