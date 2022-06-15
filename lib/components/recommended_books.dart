import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glory/models/book_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/screens/subScreens/bookDescription.dart';
import 'package:glory/services/controllers/books_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class RecommendedBooks extends StatelessWidget {
  final List<BookModel> books;
  const RecommendedBooks({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      return GetBuilder<BooksController>(
        builder: (booksController) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 1.5,
            child: ListView.builder(
                itemCount: books.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        Get.to(() => BookDescription(book: books[index]),
                            transition: Transition.size);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.8,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                                image: NetworkImage(
                                    Routes.appBaseUrl + books[index].cover),
                                fit: BoxFit.cover)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Theme.of(context).primaryColor),
                                child: Text(
                                  books[index].category,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 8.0, color: Colors.white),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.only(top: 5.0)),
                              Text(
                                books[index].title.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Padding(padding: EdgeInsets.only(top: 5.0)),
                              Text(
                                books[index].title,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Padding(padding: EdgeInsets.only(top: 5.0)),
                              Text(
                                books[index].description,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 12.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ));
                }),
          );
        },
      );
    });
  }
}
