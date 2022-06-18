import 'package:glory/data/params/new_movie_info.dart';
import 'package:glory/models/movie_model.dart';

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
    "releasedDate": info.releasedDate
  };
}

List<MovieModel> getRelatedMovies(List<MovieModel> movies, MovieModel mov) {
  List<MovieModel> results = [];
  for (MovieModel movie in movies) {
    if (movie.id != mov.id && movie.category == mov.category) {
      results.add(movie);
    }
  }
  return results;
}
