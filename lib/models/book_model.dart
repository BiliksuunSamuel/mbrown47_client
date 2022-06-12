import 'package:glory/models/rating_model.dart';

class BookModel {
  late double cost;
  late String userId;
  late String title;
  late String category;
  late String author;
  late List<dynamic> rating = [];
  late List<dynamic> raters = [];
  late String cover;
  late String tag;
  late String description;
  late String id;
  late String priority;
  late int index;
  late int paid;
  late String dateAdded;

  BookModel.fromJson(dynamic json) {
    cost = double.parse(json["cost"].toString());
    userId = json["userId"];
    title = json["title"];
    category = json["category"];
    author = json["author"];
    rating = json["rating"] as List<dynamic>;
    raters = json["raters"] as List<dynamic>;
    cover = json["cover"];
    tag = json["tag"];
    description = json["description"];
    id = json["_id"];
    dateAdded = json["dateAdded"] as String;
    index = int.parse(json["index"].toString());
    paid = int.parse(json["paid"].toString());
    priority = json["priority"];
  }
}
