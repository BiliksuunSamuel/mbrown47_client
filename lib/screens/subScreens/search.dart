import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class search extends StatelessWidget{
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

        title: Container(
          padding: const EdgeInsets.all(5.0),
          height: 40.0,
          decoration: BoxDecoration(
              color: MediaQuery.of(context).platformBrightness == Brightness.light? Colors.grey.shade100 : Colors.grey.shade800,
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: TextField(
            style: TextStyle(
                color: MediaQuery.of(context).platformBrightness == Brightness.light? Colors.black : Colors.white,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search_rounded, color: Colors.grey,),
                hintStyle: TextStyle(color: Colors.grey),
                isDense: true,
              border: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
        titleTextStyle: const TextStyle(color: Colors.white),
        iconTheme: IconThemeData(
          color: Theme.of(context).textTheme.bodyText1?.color
    ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

}