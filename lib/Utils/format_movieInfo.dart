import 'package:glory/data/params/new_movie_info.dart';

Map<String, dynamic> prepareMovieInfo(NewMovieInfo info) {
  return {
    "title": info.title,
    "description": info.description,
    "coverImage": info.coverImage,
    "size": info.size,
    "sourceUrl": info.sourceUrl,
    "trailerUrl": info.trailerUrl,
    "category": info.category,
    "tag": info.tag,
    "releasedDate":info.releasedDate
  };
}
