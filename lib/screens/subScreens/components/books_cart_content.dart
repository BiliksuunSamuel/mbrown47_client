import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/controllers/books_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class BookCartContent extends StatelessWidget {
   BookCartContent({Key? key}) : super(key: key);

  BooksController bookController = BooksController(booksRepository: Get.find());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BooksController(booksRepository: Get.find()));
    return GetBuilder<UserController>(builder: (userController) {
      Get.lazyPut(() => BooksController(booksRepository: Get.find()));
      return GetBuilder<BooksController>(
        builder: (bookController) {
          return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              itemCount:
                  getCartBooks(bookController.booksCart, bookController.books)
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
                                height: MediaQuery.of(context).size.width / 3.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                        image: NetworkImage(Routes.appBaseUrl +
                                            getCartBooks(
                                                    bookController.booksCart,
                                                    bookController.books)[index]
                                                .cover),
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
                                getCartBooks(bookController.booksCart,
                                        bookController.books)[index]
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
                                getCartBooks(bookController.booksCart,
                                        bookController.books)[index]
                                    .description,
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
                                        getCartBooks(bookController.booksCart,
                                                bookController.books)[index]
                                            .cost
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 5.0),
                                  ),
                                  Text(
                                    "\$" +
                                        getCartBooks(bookController.booksCart,
                                                bookController.books)[index]
                                            .cost
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.color,
                                        decoration: TextDecoration.lineThrough),
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
        },
      );
    });
  }
}
