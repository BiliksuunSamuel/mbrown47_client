// ignore: file_names
import 'package:glory/Utils/formatMoment.dart';
import 'package:glory/models/book_model.dart';
import 'package:simple_moment/simple_moment.dart';

List<BookModel> formatBookInfo(List<dynamic> data) {
  List<BookModel> books = [];
  for (dynamic book in data) {
    books.add(BookModel.fromJson(book));
  }
  return books;
}

// late double cost;
//   late String userId;
//   late String title;
//   late String category;
//   late String author;
//   late List<RatingModel> rating = [];
//   late List<String> raters = [];
//   late int downloads;
//   late String dateAdded;
//   late String cover;
//   late String tag;
//   late String description;
//   late String id;

List<BookModel> filterBooksByCategoryAndTag(
    List<BookModel> books, String cate, String tag, String bookId) {
  List<BookModel> results = [];
  for (BookModel book in books) {
    if (book.category == cate && book.tag == tag && book.id != bookId) {
      results.add(book);
    }
  }
  return results;
}

List<BookModel> filterPopularBooks(List<BookModel> books) {
  List<BookModel> data = [];
  for (BookModel book in books) {
    if (book.index == 1) {
      data.add(book);
    }
  }
  return data;
}

List<BookModel> filterFreeBooks(List<BookModel> data) {
  List<BookModel> books = [];
  for (BookModel book in data) {
    books.add(book);
  }
  return books;
}

List<BookModel> filterNewBooks(List<BookModel> data) {
  List<BookModel> books = [];
  for (BookModel book in data) {
    print(book.dateAdded);
    books.add(book);
  }
  return books;
}
