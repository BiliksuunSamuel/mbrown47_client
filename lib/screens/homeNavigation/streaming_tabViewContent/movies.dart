import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/filterMovies.dart';
import 'package:glory/components/list_title_label.dart';
import 'package:glory/components/movie_group_display.dart';
import 'package:glory/components/movies_display_carousel.dart';
import 'package:glory/data/data.dart';
import 'package:glory/models/movie_model.dart';
import 'package:glory/services/controllers/movies_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class Movies extends StatelessWidget {
  final List<MovieModel> movies;
  Movies({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      Get.lazyPut(() => UserController(userRepository: Get.find()));
      return GetBuilder<MoviesController>(builder: (movieController) {
        Get.lazyPut(() => MoviesController(moviesRepository: Get.find()));
        return ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            MoviesCarousel(data: movieController.movies),
            const Padding(padding: EdgeInsets.only(top: 10.0)),
            ListView.builder(
                itemCount: Data.moviesCategories.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return filterMoviesByCategory(movieController.movies,
                              Data.moviesCategories[index])
                          .isNotEmpty
                      ? Column(
                          children: [
                            ListTitleLabel(text: Data.moviesCategories[index]),
                            MovieGroupDisplay(
                                data: filterMoviesByCategory(
                                    movieController.movies,
                                    Data.moviesCategories[index]))
                          ],
                        )
                      : const SizedBox(
                          height: 5,
                        );
                })
          ],
        );
      });
    });
  }
}
