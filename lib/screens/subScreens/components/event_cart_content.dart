import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/controllers/event_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class EventCartContent extends StatelessWidget {
   EventCartContent({Key? key}) : super(key: key);

  EventsController eventsController =
      EventsController(eventRepository: Get.find());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      Get.lazyPut(() => EventsController(eventRepository: Get.find()));
      return GetBuilder<EventsController>(
        builder: (eventController) {
          return  ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                itemCount:
                    getCartEvents(eventController.cart, eventController.events)
                        .length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(8.0),
                              width: MediaQuery.of(context).size.width / 3.9,
                              child: Card(
                                elevation: 4.0,
                                margin: const EdgeInsets.all(0.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 5,
                                  height:
                                      MediaQuery.of(context).size.width / 3.5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              Routes.appBaseUrl +
                                                  getCartEvents(
                                                          eventController.cart,
                                                          eventController
                                                              .events)[index]
                                                      .poster),
                                          fit: BoxFit.cover)),
                                ),
                              )),
                          const Padding(
                            padding: EdgeInsets.only(right: 5.0),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getCartEvents(eventController.cart,
                                          eventController.events)[index]
                                      .title,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        fontSize: 14.0,
                                      ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                ),
                                Text(
                                  getCartEvents(eventController.cart,
                                          eventController.events)[index]
                                      .about,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                        fontSize: 12.0,
                                      ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                ),
                                RatingBarIndicator(
                                  rating: 4.5,
                                  unratedColor: Colors.grey,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  itemCount: 5,
                                  itemSize: 15.0,
                                  direction: Axis.horizontal,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "\$" +
                                          getCartEvents(eventController.cart,
                                                  eventController.events)[index]
                                              .cost
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 5.0),
                                    ),
                                    Text(
                                      "\$" +
                                          getCartEvents(eventController.cart,
                                                  eventController.events)[index]
                                              .cost
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.color,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          });
        },
      );
  }
}
