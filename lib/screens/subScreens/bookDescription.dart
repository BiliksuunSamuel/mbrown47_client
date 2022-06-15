import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:glory/Utils/format_bookInfo.dart';
import 'package:glory/components/custom_button.dart';
import 'package:glory/components/list_title_label.dart';
import 'package:glory/components/related_books.dart';
import 'package:glory/models/book_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/controllers/books_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class BookDescription extends StatelessWidget {
  final BookModel book;
  final List<String> _dummyAlbum = [
    "https://images.pexels.com/photos/853151/pexels-photo-853151.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.unsplash.com/photo-1493612276216-ee3925520721?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=464&q=80",
    "https://images.unsplash.com/photo-1545987796-200677ee1011?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmV0d29ya3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80),"
        "https://images.unsplash.com/photo-1545987796-200677ee1011?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmV0d29ya3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
  ];

  BookDescription({required this.book});
  late double _dummyRating = 4.0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      return GetBuilder<BooksController>(builder: (booksController) {
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
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(
                color: Theme.of(context).textTheme.bodyText1?.color),
            title: const AutoSizeText(
              "Books",
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
            centerTitle: true,
            titleTextStyle:
                Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18.0),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert_outlined,
                  ))
            ],
          ),
          body: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.8,
                    height: MediaQuery.of(context).size.width / 1.2,
                    child: Stack(children: [
                      Align(
                          alignment: FractionalOffset.centerLeft,
                          child: Card(
                            elevation: 4.0,
                            margin: const EdgeInsets.all(0.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.0,
                              height: MediaQuery.of(context).size.width / 1.2,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2.0, color: Colors.black),
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image: NetworkImage(_dummyAlbum[0]),
                                      fit: BoxFit.cover)),
                            ),
                          )),
                      Align(
                        alignment: FractionalOffset.centerRight,
                        child: Card(
                          elevation: 10.0,
                          margin: const EdgeInsets.all(0.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.0,
                            height: MediaQuery.of(context).size.width / 1.2,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(5.0),
                                    bottomRight: Radius.circular(5.0)),
                                border:
                                    Border.all(width: 2.0, color: Colors.black),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      Routes.appBaseUrl + book.cover,
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          book.title,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          book.author,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    fontSize: 14.0,
                                  ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RatingBarIndicator(
                              rating: _dummyRating,
                              unratedColor: Colors.grey,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Theme.of(context).primaryColor,
                              ),
                              itemCount: 5,
                              itemSize: 16.0,
                              direction: Axis.horizontal,
                            ),
                            const Padding(
                                padding: EdgeInsets.only(right: 10.0)),
                            Text(
                              "$_dummyRating / 5",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontSize: 14.0,
                                  ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 20.0, bottom: 20.0),
                          child: Text(
                            book.description,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  label: const Text("Preview"),
                                  icon: const Icon(Icons.read_more_rounded),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                  ),
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(right: 10.0)),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  label: const Text("Reviews"),
                                  icon: const Icon(
                                    Icons.comment_outlined,
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black)),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: booksController.booksCart.contains(book.id)
                                ? OutlinedButton(
                                    onPressed: () {
                                      booksController
                                          .handleBookCartItem(book.id);
                                    },
                                    child: const Text(
                                      "Remove From Cart",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black)),
                                  )
                                : ElevatedButton(
                                    onPressed: () {
                                      booksController
                                          .handleBookCartItem(book.id);
                                    },
                                    child: const Text("Add to Cart"),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black)),
                                  )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Buy Now for \$" + book.cost.toString(),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black)),
                            )),
                        Container(padding:const EdgeInsets.all(20),
                          child:book.userId==userController.user.id?
                          CustomButton(title: "Delete Book", elevated: false, handlePressed: (){
                            booksController.handleDeleteBook(book.id,book.cover);
                          }):Container()
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(booksController.rm.error,textAlign: TextAlign.center,style:const TextStyle(fontSize: 15,color:Colors.red),),
                            Text(booksController.rm.message,textAlign: TextAlign.center,style:const TextStyle(fontSize: 15,color:Colors.green),)
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10.0)),
                         ListTitleLabel(text: "Related Books"),
                        RelatedBooks(books: filterBooksByCategoryAndTag(booksController.books, book.category, book.tag,book.id))
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      });
    });
  }
}
