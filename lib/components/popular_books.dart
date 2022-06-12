import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:glory/models/book_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/screens/subScreens/bookDescription.dart';

class PopularBooks extends StatelessWidget {
  final List<BookModel> books;
  const PopularBooks({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 1.5,
      child: ListView.builder(
          itemCount:books.length>1? books.length-1:0,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: () {
                  Get.to(
                      () => BookDescription(
                            book: books[index],
                          ),
                      transition: Transition.size);
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 5,
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
                                  width:
                                      MediaQuery.of(context).size.width / 3.3,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2.0, color: Colors.black),
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(books[index].cover),
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
                                width: MediaQuery.of(context).size.width / 3.3,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(5.0),
                                        bottomRight: Radius.circular(5.0)),
                                    border: Border.all(
                                        width: 2.0, color: Colors.black),
                                    image: DecorationImage(
                                        image: NetworkImage(Routes.appBaseUrl +
                                            books[index].cover),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Flexible(
                          flex: 2,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3,
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  books[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        fontSize: 14.0,
                                      ),
                                ),
                                Text(
                                  books[index].author,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                        fontSize: 12.0,
                                      ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "\$" + books[index].cost.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                            fontSize: 12.0,
                                          ),
                                    ),
                                    const Spacer(),
                                    RatingBarIndicator(
                                      rating: 4.5,
                                      unratedColor: Colors.grey,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      itemCount: 5,
                                      itemSize: 10.0,
                                      direction: Axis.horizontal,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
