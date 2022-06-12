import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:glory/models/book_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/screens/subScreens/bookDescription.dart';

class NewBooks extends StatelessWidget {
  final List<BookModel> books;
  const NewBooks({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: books.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Get.to(() => BookDescription(book: books[index]),
                    transition: Transition.size);
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      width: MediaQuery.of(context).size.width / 3.9,
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
                                width: MediaQuery.of(context).size.width / 5,
                                height: MediaQuery.of(context).size.width / 3.5,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2.0, color: Colors.black),
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                        image: NetworkImage(Routes.appBaseUrl +
                                            books[index].cover),
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
                              width: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.width / 3.5,
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
                            books[index].title,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontSize: 14.0,
                                    ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5.0),
                          ),
                          Text(
                            books[index].author,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(fontSize: 12.0),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5.0),
                          ),
                          RatingBarIndicator(
                            rating: 4.5,
                            unratedColor: Colors.white,
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
                                "\$" + books[index].cost.toString(),
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Theme.of(context).primaryColor),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 5.0),
                              ),
                              Text(
                                "\$" + books[index].cost.toString(),
                                style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
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
          }),
    );
  }
}
