import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glory/controllers/navigation_get.dart';
import 'package:glory/screens/subScreens/messages/messages.dart';
import 'package:glory/screens/homeNavigation/story.dart';
import 'package:glory/screens/homeNavigation/streaming.dart';
import 'books.dart';
import 'events.dart';
import 'music.dart';

class navigation extends StatelessWidget {
  final PageController _navController = PageController(initialPage: 0);
  navigation_get getController = Get.put(navigation_get());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<navigation_get>(builder: (controller) {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        floatingActionButton: Visibility(
          visible: getController.selectedIndex == 0? false : true,
          child: FloatingActionButton(
            onPressed: (){
              Get.to(()=>messages(), transition: Transition.size);
            },
            child: const Icon(Icons.mail_outline_rounded),
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ),
        extendBody: true,
        bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0), ),
      child: BottomNavigationBar(
          currentIndex: getController.selectedIndex,
            onTap: (int index){
            getController.updateIndex(index);
            _navController.jumpToPage(index);
            },
        // type: BottomNavigationBarType.shifting,
        // backgroundColor: Colors.grey.shade900,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        // unselectedItemColor: Colors.grey,
        // selectedItemColor: Theme.of(context).primaryColor,
            items: const [
              BottomNavigationBarItem(
                label: "Reels", icon: Icon(Icons.donut_large_outlined),
                  activeIcon: Icon(Icons.donut_large_rounded)
              ),
              BottomNavigationBarItem(
                label: "Streaming", icon: Icon(Icons.ondemand_video_outlined),
                  activeIcon: Icon(Icons.ondemand_video_rounded)
              ),
              BottomNavigationBarItem(
                label: "Music", icon: Icon(Icons.music_note_outlined),
                activeIcon: Icon(Icons.music_note_rounded)
              ),
              BottomNavigationBarItem(
                label: "Books", icon: Icon(Icons.book_outlined),
                  activeIcon: Icon(Icons.book_rounded)
              ),
              BottomNavigationBarItem(
                label: "Events", icon: Icon(Icons.event_outlined),
                  activeIcon: Icon(Icons.event_rounded)
              ),
            ],
        ),
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _navController,
          onPageChanged: (index) {},
          children: [
            story(),
            streaming(),
            music(),
            books(),
            events(),
          ],
        ),
      );
    });
  }
}