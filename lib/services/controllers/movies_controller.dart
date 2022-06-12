import 'package:get/get.dart';
import 'package:glory/Utils/format_movieInfo.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/data/params/new_movie_info.dart';
import 'package:glory/models/movie_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/repositories/movies_repository.dart';

class MoviesController extends GetxController {
  final MoviesRepository moviesRepository;

  NewMovieInfo info = NewMovieInfo();
  MoviesController({required this.moviesRepository});
  List<MovieModel> movies = [];
  bool loading = false;
  String error = "";
  String message = "";

  Future<void> getMovies() async {
    try {
      Response response = await moviesRepository.getMovies(Routes.moviesGet);
      if (response.statusCode == 200 || response.statusCode == 201) {
        movies = formatMoviesInfo(response.body);
        update();
      } else {
        print(response.statusText);
        update();
      }
    } catch (err) {
      print(err);
    }
  }

  void uploadMovie() async {
    Response response = await moviesRepository.uploadMovie(
        Routes.movieUpload, prepareMovieInfo(info));
    if (response.statusCode == 200 || response.statusCode == 201) {
      message = response.body;
      loading = false;
      update();
    } else {
      error = response.statusText.toString();
      loading = false;
      update();
    }
  }

  void handleCategory(dynamic cate) {
    info.category = cate;
    update();
  }
}
