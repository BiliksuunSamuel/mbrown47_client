import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glory/models/movie_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/screens/subScreens/movieDescription.dart';

class MoviesCarousel extends StatelessWidget {
  final List<MovieModel> data;
  const MoviesCarousel({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 2,
      margin: const EdgeInsets.only(top: 5.0),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
        ),
        items: data.map((movie) {
          return Builder(
            builder: (BuildContext context) {
              return InkWell(
                onTap: () {
                  Get.to(
                      () => movieDescription(
                            movie: movie,
                          ),
                      transition: Transition.size);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: NetworkImage(
                              Routes.appBaseUrl + movie.coverImage),
                          fit: BoxFit.cover)),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
