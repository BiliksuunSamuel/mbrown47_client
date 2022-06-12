import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/cWidgets.dart';

import 'chat.dart';

class messages extends StatelessWidget {
  final cWidgets _widgets = cWidgets();
  final List<String> _dummyAlbum = [
    "https://images.pexels.com/photos/853151/pexels-photo-853151.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.unsplash.com/photo-1493612276216-ee3925520721?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=464&q=80",
    "https://images.unsplash.com/photo-1545987796-200677ee1011?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmV0d29ya3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
    "https://images.pexels.com/photos/853151/pexels-photo-853151.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.unsplash.com/photo-1493612276216-ee3925520721?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=464&q=80",
    "https://images.unsplash.com/photo-1545987796-200677ee1011?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmV0d29ya3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
    "https://images.pexels.com/photos/853151/pexels-photo-853151.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.unsplash.com/photo-1493612276216-ee3925520721?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=464&q=80",
    "https://images.unsplash.com/photo-1545987796-200677ee1011?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmV0d29ya3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
    "https://images.pexels.com/photos/853151/pexels-photo-853151.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.unsplash.com/photo-1493612276216-ee3925520721?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=464&q=80",
    "https://images.unsplash.com/photo-1545987796-200677ee1011?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmV0d29ya3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
  ];

  final String _dummyTitle = "This is the Title";
  final String _dummyDescription = "This is the Description";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).backgroundColor,
            statusBarBrightness: MediaQuery.of(context).platformBrightness == Brightness.light? Brightness.light:Brightness.dark,
            statusBarIconBrightness: MediaQuery.of(context).platformBrightness == Brightness.dark? Brightness.light:Brightness.dark,
          ),
          title: InkWell(
              onTap: () {},
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    AutoSizeText(
                      "@user_name",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18.0),
                      maxLines: 1,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Theme.of(context).textTheme.bodyText1?.color,
                    )
                  ])),
          centerTitle: false,
          titleTextStyle: const TextStyle(color: Colors.white),
          iconTheme: IconThemeData(
              color: Theme.of(context).textTheme.bodyText1?.color
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(65.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  height: 35.0,
                  decoration: BoxDecoration(
                      color: MediaQuery.of(context).platformBrightness == Brightness.light? Colors.grey.shade100 : Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                      ),
                      suffixIcon: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.filter_alt_outlined,
                            color: MediaQuery.of(context).platformBrightness == Brightness.light? Colors.black : Colors.white,
                          )),
                      hintStyle: const TextStyle(color: Colors.grey),
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
                TabBar(
                  labelColor: Theme.of(context).textTheme.bodyText1?.color,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      height: 30.0,
                      child: Text(
                        "Primary",
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "General",
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.bold),
                      ),
                      height: 30.0,
                    ),
                    Tab(
                      child: Text(
                        "Requests",
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.bold),
                      ),
                      height: 30.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [_widgets.newMessageButton(context: context)],
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Get.to(() => chat(), transition: Transition.rightToLeft);
                  },
                  minVerticalPadding: 15.0,
                  dense: true,
                  leading: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        image: DecorationImage(
                            image: NetworkImage(_dummyAlbum[index]),
                            fit: BoxFit.cover)),
                  ),
                  title: Text(
                    _dummyTitle,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith( fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    _dummyDescription,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.photo_camera_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                );
              },
              itemCount: _dummyAlbum.length,
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Get.to(() => chat(), transition: Transition.rightToLeft);
                  },
                  minVerticalPadding: 15.0,
                  dense: true,
                  leading: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        image: DecorationImage(
                            image: NetworkImage(_dummyAlbum[index]),
                            fit: BoxFit.cover)),
                  ),
                  title: Text(
                    _dummyTitle,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    _dummyDescription,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.photo_camera_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                );
              },
              itemCount: _dummyAlbum.length,
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    onTap: () {
                      Get.to(() => chat(), transition: Transition.rightToLeft);
                    },
                    minVerticalPadding: 15.0,
                    dense: true,
                    leading: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          image: DecorationImage(
                              image: NetworkImage(_dummyAlbum[index]),
                              fit: BoxFit.cover)),
                    ),
                    title: Text(
                      _dummyTitle,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith( fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      _dummyDescription,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.check_rounded,
                              color: Theme.of(context).primaryColor,
                              size: 20.0,
                            ),
                            splashRadius: 20.0,
                            splashColor: Theme.of(context).primaryColor,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Colors.red,
                              size: 20.0,
                            ),
                            splashRadius: 20.0,
                            splashColor: Colors.red,
                          ),
                        ],
                      ),
                    ));
              },
              itemCount: _dummyAlbum.length,
            ),
          ],
        ),
      ),
    );
  }
}
