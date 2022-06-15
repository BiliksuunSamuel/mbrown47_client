import 'package:get/get.dart';
import 'package:glory/Utils/format_bookInfo.dart';
import 'package:glory/data/params/new_book_info.dart';
import 'package:glory/models/book_model.dart';
import 'package:glory/models/response_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/repositories/books_repository.dart';

class BooksController extends GetxController {
  final BooksRepository booksRepository;
  List<String> booksCart = [];
  late List<BookModel> books = [];
  late NewBookInfo newBookInfo = NewBookInfo();
  late ResponseModel rm = ResponseModel();
  BooksController({required this.booksRepository});

  @override
  void onInit() {
    getBooks();
    super.onInit();
  }

  void getBooks() async {
    try {
      Response response = await booksRepository.getBooks(Routes.booksGet);
      if (response.statusCode == 200 || response.statusCode == 201) {
        books = formatBookInfo(response.body);
        update();
      } else {
        rm.error = response.statusText!;
        update();
      }
    } catch (err) {
      print(err);
      update();
    }
  }

  void addBook() async {
    rm.loading = true;
    FormData bookData = FormData({
      "author": newBookInfo.author,
      "title": newBookInfo.title,
      "tag": newBookInfo.tag,
      "description": newBookInfo.description,
      "cost": newBookInfo.cost,
      "category": newBookInfo.category,
      "cover": newBookInfo.cover,
      "userId": newBookInfo.user,
      "priority": newBookInfo.priority,
      "paid": newBookInfo.paid,
      "index": newBookInfo.index
    });
    Response response =
        await booksRepository.addNewBook(bookData, Routes.booksAdd);
    if (response.statusCode == 200 || response.statusCode == 201) {
      rm.message = response.body;
      rm.loading = false;
      print(response.body);
      update();
    } else {
      rm.error = response.statusText!;
      rm.loading = false;
      update();
    }
  }

  //
  void handleBookCartItem(String bookId) {
    if (booksCart.contains(bookId)) {
      booksCart.remove(bookId);
      update();
    } else {
      booksCart.add(bookId);
    }
  }

  // handle delete book
  void handleDeleteBook(String bookId, String coverPath) async {
    Map<String, dynamic> data = {"id": bookId, "path": coverPath};
    try {
      Response response =
          await booksRepository.addNewBook(data, Routes.deleteBook);
      if (response.statusCode == 200 || response.statusCode == 201) {
        rm.message = response.body;
        update();
      } else {
        rm.error = response.statusText.toString();
        update();
      }
    } catch (err) {
      print(err);
      rm.error = err.toString();
      update();
    }
  }
}
