import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/format_eventInfo.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/components/custom_button.dart';
import 'package:glory/components/list_title_label.dart';
import 'package:glory/models/event_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/controllers/event_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class eventDescription extends StatelessWidget {
  final EventModel event;

  eventDescription({required this.event});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      return GetBuilder<EventsController>(builder: (eventController) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? Brightness.light
                      : Brightness.dark,
              statusBarIconBrightness:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Brightness.light
                      : Brightness.dark,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(
                color: Theme.of(context).textTheme.bodyText1?.color),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_outlined,
                ),
                splashColor: Theme.of(context).primaryColor,
                splashRadius: 20.0,
              )
            ],
          ),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 1.2,
                    child: Stack(
                      children: [
                        Align(
                            alignment: FractionalOffset.topCenter,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width * 1.1,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          Routes.appBaseUrl + event.poster),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(20.0)),
                            )),
                        Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Card(
                            color: Colors.white,
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(5.0),
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: ListTile(
                                dense: true,
                                title: Text(
                                  event.title,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: event.subtitle,
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    TextSpan(
                                        text: "\n\$" + event.cost.toString(),
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            overflow: TextOverflow.ellipsis)),
                                  ]),
                                ),
                                trailing: Container(
                                  height: 50.0,
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1.0, color: Colors.black),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              Routes.appBaseUrl + event.poster),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: ListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.all(0.0),
                          horizontalTitleGap: 5.0,
                          leading: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(Routes.appBaseUrl +
                                getProfileImage(getUser(
                                    userController.users, event.userId))),
                          ),
                          title: Text(
                            event.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            event.subtitle,
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontSize: 10,
                                    ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.call_rounded,
                          color: Theme.of(context).textTheme.bodyText1?.color,
                        ),
                        splashColor: Theme.of(context).primaryColor,
                        splashRadius: 20.0,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.mail_outline_rounded,
                          color: Theme.of(context).textTheme.bodyText1?.color,
                        ),
                        splashColor: Theme.of(context).primaryColor,
                        splashRadius: 20.0,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 10.0, bottom: 10.0),
                    child: Text(
                      "About",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      event.about,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontSize: 12.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50.0,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: eventController.eventsCart.contains(event.id)
                          ? OutlinedButton(
                              onPressed: () {
                                eventController.handleEventCart(event.id);
                              },
                              child: const Text(
                                "Remove",
                                style: TextStyle(color: Colors.red,),
                              ))
                          : ElevatedButton(
                              onPressed: () {
                                eventController.handleEventCart(event.id);
                              },
                              child: const Text(
                                "Book Now",
                              ))),

                      (userController.user.id==event.userId)?
                       Container(
                        padding:const EdgeInsets.all(20),
                        child: CustomButton(
                      title: "Delete Event",
                      elevated: false,
                      handlePressed: () {
                        eventController.handleDeleteEvent(event.id,event.poster);
                      }),
                       ):Container(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(eventController.message,textAlign: TextAlign.center,style: const TextStyle(color:Colors.green),),
                          Text(eventController.error,textAlign: TextAlign.center,style: const TextStyle(color:Colors.red,),),
                        ],
                      ),
                  const Padding(padding: EdgeInsets.only(top: 10.0)),
                  const ListTitleLabel(text: "Recommended"),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    height: MediaQuery.of(context).size.width / 2.5,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: filterRecommendedEvent(
                                eventController.events, event.id)
                            .length,
                        padding: const EdgeInsets.only(left: 10.0),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: InkWell(
                              onTap: () {
                                Get.to(() => eventDescription(
                                      event: event,
                                    ));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                      image: NetworkImage(Routes.appBaseUrl +
                                          eventController.events[index].poster),
                                      fit: BoxFit.cover),
                                ),
                                child: Align(
                                  alignment: FractionalOffset.bottomCenter,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade800,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0)),
                                    ),
                                    child: ListTile(
                                      dense: true,
                                      title: Text(
                                        eventController.events[index].title,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(
                                          eventController
                                              .events[index].subtitle,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
