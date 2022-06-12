import 'package:glory/models/rating_model.dart';

class SongModel {
  late double size;
  late String title;
  late String cover;
  late String artist;
  late String description;
  late String category;
  late List<dynamic> likes;
  late List<dynamic> wishlist;
  late List<dynamic> raters;
  late List<dynamic> ratings;
  late String source;
  late String id;
  
  SongModel.fromJson(Map<String, dynamic> info) {
    size = double.parse(info["size"].toString());
    title = info["title"];
    cover = info["cover"];
    artist = info["artist"];
    description = info["description"];
    category = info["category"];
    likes = info["likes"];
    wishlist = info["wishlist"];
    raters = info["raters"];
    ratings = info["ratings"];
    source = info["source"];
    id = info["_id"];
  }
}
