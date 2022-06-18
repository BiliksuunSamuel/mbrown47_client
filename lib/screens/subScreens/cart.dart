import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/components/custom_button.dart';
import 'package:glory/components/list_title_label.dart';
import 'package:glory/screens/subScreens/checkout/checkout.dart';
import 'package:glory/screens/subScreens/components/books_cart_content.dart';
import 'package:glory/screens/subScreens/components/event_cart_content.dart';
import 'package:glory/services/controllers/books_controller.dart';
import 'package:glory/services/controllers/event_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      Get.lazyPut(() => BooksController(booksRepository: Get.find()));
      return GetBuilder<BooksController>(builder: (bookController) {
        Get.lazyPut(() => EventsController(eventRepository: Get.find()));
        return GetBuilder<EventsController>(builder: (eventsController) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Theme.of(context).backgroundColor,
                statusBarBrightness:
                    MediaQuery.of(context).platformBrightness ==
                            Brightness.light
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
              actionsIconTheme: IconThemeData(
                  color: Theme.of(context).textTheme.bodyText1?.color),
              title: AutoSizeText(
                "Cart",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontSize: 18.0),
                maxLines: 1,
              ),
              centerTitle: true,
              titleTextStyle: const TextStyle(color: Colors.white),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert_outlined,
                  ),
                  splashRadius: 20.0,
                  splashColor: Theme.of(context).primaryColor,
                )
              ],
            ),
            body: Column(
              children: [
                bookController.booksCart.isNotEmpty
                    ? ListTitleLabel(text: "Cart Books")
                    : Container(),
                bookController.booksCart.isNotEmpty
                    ? BookCartContent()
                    : Container(),
                eventsController.cart.isNotEmpty
                    ? ListTitleLabel(text: "Cart Events")
                    : Container(),
                eventsController.cart.isNotEmpty
                    ? EventCartContent()
                    : Container(),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(
                          height: 0.0,
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.light
                              ? Colors.grey
                              : Colors.white,
                          thickness: 0.5,
                        ),
                      ),
                      ListTitleLabel(
                        text: "Total",
                        trailText: "\$" +
                           ( getCartCost(getCartBooks(bookController.booksCart,
                                    bookController.books))+getCartEventsCost(getCartEvents(eventsController.cart, eventsController.events))
                           ).toString(),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: CustomButton(
                          title: "Proceed to CheckOut",
                          elevated: true,
                          handlePressed: () {
                            Get.off(() => checkout(),
                                transition: Transition.rightToLeft);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      });
    });
  }
}
