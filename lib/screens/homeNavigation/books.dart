import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/cWidgets.dart';
import 'package:glory/Utils/format_bookInfo.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/components/free_books_display.dart';
import 'package:glory/components/list_title_label.dart';
import 'package:glory/components/newer_books.dart';
import 'package:glory/components/popular_books.dart';
import 'package:glory/components/recommended_books.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/screens/subScreens/search.dart';
import 'package:glory/services/controllers/books_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class books extends StatelessWidget {
  final cWidgets _widgets = cWidgets();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      Get.lazyPut(() => BooksController(booksRepository: Get.find()));
      userController.getUsers();
      return GetBuilder<BooksController>(builder: (booksController) {
        booksController.getBooks();
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
                      "Books",
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
                profileImageURL:
                    Routes.appBaseUrl + getProfileImage(userController.user),
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
              _widgets.addBookButton(context: context),
              _widgets.wheelButton(context: context),
              _widgets.cartButton(
                  context: context, cartSize: booksController.booksCart.length),
            ],
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              ListTitleLabel(text: "Popular Books"),
              PopularBooks(books: filterPopularBooks(booksController.books)),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              ListTitleLabel(text: "Daily Recommended"),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              RecommendedBooks(books: booksController.books),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              ListTitleLabel(text: "Top Free"),
              FreeBooksDisplay(books: filterFreeBooks(booksController.books)),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              ListTitleLabel(text: "Newest"),
              NewBooks(books: filterNewBooks(booksController.books)),
              const Padding(padding: EdgeInsets.only(top: 30.0)),
            ],
          ),
        );
      });
    });
  }
}
