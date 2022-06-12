import 'package:glory/models/movie_model.dart';

List<MovieModel> filterMoviesByCategory(List<MovieModel> movies, dynamic cate) {
  List<MovieModel> results = [];
  for (MovieModel movie in movies) {
    if (movie.category == cate) {
      results.add(movie);
    }
  }
  return results;
}

List<dynamic> getRelatedMovies(List<dynamic> data, dynamic id) {
  List<dynamic> results = [];
  for (int i = 0; i < data.length; i++) {
    dynamic movie = data[i];
    if (movie["_id"] != id) {
      results.add(movie);
    }
  }

  return results;
}
