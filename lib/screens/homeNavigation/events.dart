import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/cWidgets.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/screens/subScreens/eventDescription.dart';
import 'package:glory/screens/subScreens/search.dart';
import 'package:glory/services/controllers/event_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class events extends StatelessWidget {
  final cWidgets _widgets = cWidgets();
  @override
  Widget build(BuildContext context) {
    EventsController(eventRepository: Get.find()).getEvents();
    return GetBuilder<UserController>(builder: (userController) {
      return GetBuilder<EventsController>(builder: (eventController) {
        eventController.getEvents();
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
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
            title: InkWell(
                onTap: () {
                  Get.to(() => search(), fullscreenDialog: true);
                },
                child: const SizedBox(
                    width: double.maxFinite,
                    child: AutoSizeText(
                      "Events",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ))),
            centerTitle: true,
            titleTextStyle:
                Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18.0),
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: _widgets.profileButton(
                context: context,
                profileImageURL:Routes.appBaseUrl+getProfileImage(userController.user),
                personalProfile: true),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(2.0),
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Divider(
                  height: 0.0,
                  thickness: 0.5,
                  color: Colors.grey,
                ),
              ),
            ),
            actions: [
              _widgets.newEventButton(context: context),
              _widgets.wheelButton(context: context),
              _widgets.cartButton(context: context,cartSize: eventController.eventsCart.length),
            ],
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              ListTile(
                title: Text(
                  "Trending Events near you",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                height: MediaQuery.of(context).size.width / 2,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: eventController.events.length,
                    padding: const EdgeInsets.only(left: 10.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => eventDescription(event: eventController.events[index],),
                                transition: Transition.size);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                  image: NetworkImage(Routes.appBaseUrl +
                                      eventController.events[index].poster),
                                  fit: BoxFit.cover),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Container(
                                    width: 60.0,
                                    height: 25.0,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            bottomRight: Radius.circular(20.0)),
                                        color: Theme.of(context).primaryColor),
                                    child: const Center(
                                        child: Text(
                                      "Top",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.0),
                                    )),
                                  ),
                                ),
                                Align(
                                  alignment: FractionalOffset.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50.0),
                                    child: Container(
                                      width: 25.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(10.0),
                                              bottomRight:
                                                  Radius.circular(10.0)),
                                          color:
                                              Theme.of(context).primaryColor),
                                      child: const Center(
                                          child: Icon(
                                        Icons.bookmark_outline,
                                        color: Colors.white,
                                        size: 20.0,
                                      )),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: FractionalOffset.bottomCenter,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade800,
                                      borderRadius:const BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0)),
                                    ),
                                    child: ListTile(
                                      dense: true,
                                      title:  Text(
                                        eventController.events[index].title,
                                        style:const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle:
                                           Text(eventController.events[index].subtitle,
                                              style:const TextStyle(
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.ellipsis),
                                      trailing: Text("\$"+eventController.events[index].cost.toString(),
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              ListTile(
                title: Text(
                  "Category",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child: const Text("See All"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                height: MediaQuery.of(context).size.width / 4,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: eventController.events.length,
                    padding: const EdgeInsets.only(left: 10.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => eventDescription(event:eventController.events[index]),
                                transition: Transition.size);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                  image: NetworkImage(Routes.appBaseUrl+eventController.events[index].poster),
                                  fit: BoxFit.cover),
                            ),
                            child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: Container(
                                width: double.maxFinite,
                                height: 30.0,
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  borderRadius:const BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0)),
                                ),
                                child:  Center(
                                    child: Text(
                                  eventController.events[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              ListTile(
                title: Text(
                  "Upcoming Events",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child: const Text("See All"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                height: MediaQuery.of(context).size.width / 2.5,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: eventController.events.length,
                    padding: const EdgeInsets.only(left: 10.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => eventDescription(event: eventController.events[index]),
                                transition: Transition.size);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                  image: NetworkImage(Routes.appBaseUrl+eventController.events[index].poster),
                                  fit: BoxFit.cover),
                            ),
                            child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  borderRadius:const BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0)),
                                ),
                                child:  ListTile(
                                  dense: true,
                                  title: Text(
                                    eventController.events[index].title,
                                    style:const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Text(
                                    eventController.events[index].subtitle,
                                    overflow: TextOverflow.ellipsis,
                                    style:const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              ListTile(
                title: Text(
                  "Nearest City",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child: const Text("See All"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                height: MediaQuery.of(context).size.width / 4,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: eventController.events.length,
                    padding: const EdgeInsets.only(left: 10.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => eventDescription(event: eventController.events[index]),
                                transition: Transition.size);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                  image: NetworkImage(Routes.appBaseUrl+eventController.events[index].poster),
                                  fit: BoxFit.cover),
                            ),
                            child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: Container(
                                width: double.maxFinite,
                                height: 30.0,
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  borderRadius:const BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0)),
                                ),
                                child:  Center(
                                    child: Text(
                                  eventController.events[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  style:const TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      });
    });
  }
}
