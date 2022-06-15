import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/screens/subScreens/checkout/checkoutSuccess.dart';
import 'package:glory/services/controllers/books_controller.dart';
import 'package:glory/services/controllers/event_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      Get.lazyPut(() => BooksController(booksRepository: Get.find()));
      Get.lazyPut(() => EventsController(eventRepository: Get.find()));
      return GetBuilder<BooksController>(builder: (bookController) {
        return GetBuilder<EventsController>(builder: (eventController) {
          return DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.grey.shade900,
                    statusBarBrightness: Brightness.dark,
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  iconTheme: const IconThemeData(color: Colors.white),
                ),
                body: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width / 1.5,
                            child: Stack(
                              children: [
                                Align(
                                    alignment: FractionalOffset.topCenter,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.width /
                                              1.8,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade900,
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                    )),
                                Align(
                                  alignment: FractionalOffset.center,
                                  child: ListTile(
                                    dense: true,
                                    title: const Text(
                                      "Checkout",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16.0),
                                    ),
                                    trailing: Text(
                                      "\$" +
                                          getCartCost(getCartBooks(
                                                  bookController.booksCart,
                                                  bookController.books))
                                              .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 16.0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: FractionalOffset.bottomCenter,
                                  child: Card(
                                    margin: const EdgeInsets.all(0.0),
                                    color: Colors.white,
                                    elevation: 8.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      child: TabBar(
                                        labelColor: Colors.white,
                                        unselectedLabelColor: Colors.black,
                                        indicator: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                        indicatorSize: TabBarIndicatorSize.tab,
                                        tabs: [
                                          const Tab(
                                            icon:
                                                Icon(Icons.credit_card_rounded),
                                            text: "Credit Card",
                                          ),
                                          Tab(
                                            icon: Image.asset(
                                              "assets/images/apple.png",
                                              width: 20.0,
                                              height: 20.0,
                                              color: Colors.black,
                                            ),
                                            text: "Apple Pay",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 10.0)),
                          const ListTile(
                            dense: true,
                            title: Text(
                              "Card Number",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16.0),
                            ),
                          ),
                          Card(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              color: Colors.white,
                              elevation: 8.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: const Center(
                                  child: TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    maxLength: 16,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "1111 2222 3333 4444",
                                      counterText: "",
                                      contentPadding: EdgeInsets.all(10.0),
                                      border: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      suffixIcon:
                                          Icon(Icons.credit_card_rounded),
                                    ),
                                  ),
                                ),
                              )),
                          const Padding(padding: EdgeInsets.only(top: 10.0)),
                          const ListTile(
                            dense: true,
                            title: Text(
                              "Card Holder Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16.0),
                            ),
                          ),
                          Card(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              color: Colors.white,
                              elevation: 8.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: const Center(
                                  child: TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "John Helen",
                                      focusedErrorBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.all(10.0),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Expiry Date",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16.0),
                                    ),
                                    Row(
                                      children: [
                                        Card(
                                            color: Colors.white,
                                            elevation: 8.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6,
                                              child: const Center(
                                                child: TextField(
                                                  maxLength: 2,
                                                  maxLengthEnforcement:
                                                      MaxLengthEnforcement
                                                          .enforced,
                                                  textAlign: TextAlign.center,
                                                  textAlignVertical:
                                                      TextAlignVertical.center,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    hintText: "DD",
                                                    counterText: "",
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.all(10.0),
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            )),
                                        const Text(
                                          "/",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0),
                                        ),
                                        Card(
                                            color: Colors.white,
                                            elevation: 8.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              child: const Center(
                                                child: TextField(
                                                  maxLength: 4,
                                                  maxLengthEnforcement:
                                                      MaxLengthEnforcement
                                                          .enforced,
                                                  textAlignVertical:
                                                      TextAlignVertical.center,
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    hintText: "YYYY",
                                                    counterText: "",
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.all(10.0),
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "CVV/CVC",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16.0),
                                    ),
                                    Card(
                                        color: Colors.white,
                                        elevation: 8.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          child: const Center(
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              maxLength: 3,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              maxLengthEnforcement:
                                                  MaxLengthEnforcement.enforced,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                counterText: "",
                                                hintText: "XXX",
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                contentPadding:
                                                    EdgeInsets.all(10.0),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 50.0),
                            child: const Center(
                              child: Text(
                                  "We'll send you payment details to your email after the successful payment.",
                                  style: TextStyle(
                                      fontSize: 10.0, color: Colors.grey),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50.0,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Get.off(() => checkoutSuccess(),
                                      transition: Transition.rightToLeft,
                                      fullscreenDialog: true);
                                },
                                label: const Text("Proceed to Pay"),
                                icon: const Icon(Icons.lock_rounded),
                              )),
                          const Padding(padding: EdgeInsets.only(bottom: 20.0)),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        });
      });
    });
  }
}
