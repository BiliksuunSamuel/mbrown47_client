import 'package:glory/models/rating_model.dart';

class MovieModel {
  late int downloads;
  late String sourceUrl;
  late String title;
  late List<dynamic> ratings;
  late String coverImage;
  late String dateAdded;
  late double size;
  late String trailerUrl;
  late String description;
  late String category;
  late String tag;
  late String id;

  MovieModel.fromJson(dynamic info) {
    downloads = int.parse(info["downloads"].toString());
    sourceUrl = info["sourceUrl"];
    title = info["title"];
    ratings = info["ratings"] as List<dynamic>;
    coverImage = info["coverImage"];
    dateAdded = info["dateAdded"];
    size = double.parse(info["size"].toString());
    trailerUrl = info["trailerUrl"];
    description = info["description"];
    category = info["category"];
    tag = info["tag"];
    id = info["_id"];
  }
}
