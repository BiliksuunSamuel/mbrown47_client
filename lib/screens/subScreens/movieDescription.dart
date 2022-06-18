import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/formatMoment.dart';
import 'package:glory/Utils/format_movieInfo.dart';
import 'package:glory/components/list_title_label.dart';
import 'package:glory/models/movie_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/controllers/movies_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class movieDescription extends StatelessWidget {
  final MovieModel movie;
  final String _videoMaxQuality = "4K";
  final String _movieTotalMinutes = "165";

  final List<String> _movieGenre = ["Action", "Comedy", "Romance"];

  movieDescription({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      Get.lazyPut(() => UserController(userRepository: Get.find()));
      return GetBuilder<MoviesController>(builder: (movieController) {
        Get.lazyPut(() => MoviesController(moviesRepository: Get.find()));
        return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarBrightness:
                    MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? Brightness.light
                        : Brightness.dark,
                statusBarIconBrightness:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? Brightness.light
                        : Brightness.dark,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              iconTheme: IconThemeData(
                  color: Theme.of(context).textTheme.bodyText1?.color),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                Routes.appBaseUrl + movie.coverImage),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20.0)),
                  ListTile(
                    title: Row(
                      children: [
                        Text(
                          movie.title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 10.0)),
                        Container(
                            padding: const EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              _videoMaxQuality,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10.0),
                            )),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Icon(
                            Icons.access_time_outlined,
                            color: Theme.of(context).textTheme.bodyText2?.color,
                            size: 20.0,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 4.0)),
                        Text(
                          _movieTotalMinutes + " minutes",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontSize: 12.0),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 15.0)),
                        Icon(
                          Icons.star_rate_outlined,
                          color: Theme.of(context).textTheme.bodyText2?.color,
                          size: 20.0,
                        ),
                        const Padding(padding: EdgeInsets.only(left: 4.0)),
                        Text(
                          "8.5",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontSize: 12.0),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              "Release date",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(fontSize: 16.0),
                            )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                              "Genre",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(fontSize: 16.0),
                            )),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.2,
                          child: Text(
                            formatMoment(movie.dateAdded),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(fontSize: 12.0),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.2,
                          child: GridView.builder(
                            padding: const EdgeInsets.only(top: 10.0),
                            itemCount: _movieGenre.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade800,
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Center(
                                      child: Text(
                                    _movieGenre[index],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12.0),
                                  )),
                                ),
                              );
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 5.0,
                              childAspectRatio: 2.4,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(
                      title: Text(
                        "Description",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: 16.0),
                      ),
                      subtitle: Text(movie.description,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontSize: 12.0))),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  ListTitleLabel(text: "Related Movies"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 2,
                    child: ListView.builder(
                        itemCount:
                            getRelatedMovies(movieController.movies, movie)
                                .length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          MovieModel relatedMovie = getRelatedMovies(
                              movieController.movies, movie)[index];
                          return InkWell(
                            onTap: () {
                              Get.to(() => movieDescription(
                                    movie: movie,
                                  ));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          Routes.appBaseUrl+relatedMovie.coverImage),
                                      fit: BoxFit.cover)),
                            ),
                          );
                        }),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 30.0))
                ],
              ),
            ));
      });
    });
  }
}
