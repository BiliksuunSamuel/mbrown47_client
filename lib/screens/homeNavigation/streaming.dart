import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/cWidgets.dart';
import 'package:glory/screens/homeNavigation/streaming_tabViewContent/movies.dart';
import 'package:glory/screens/homeNavigation/streaming_tabViewContent/videoGames.dart';
import 'package:glory/screens/subScreens/search.dart';
import 'package:glory/services/controllers/movies_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class streaming extends StatelessWidget {
  final String _dummyProfilePictureURL =
      "https://images.pexels.com/photos/853151/pexels-photo-853151.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  final cWidgets _widgets = cWidgets();

  @override
  Widget build(BuildContext context) {
    MoviesController(moviesRepository: Get.find()).getMovies();
    return DefaultTabController(
        length: 2,
        child: GetBuilder<UserController>(
          builder: (userController) {
            return GetBuilder<MoviesController>(
              builder: (movieController) {
                return Scaffold(
                  backgroundColor: Theme.of(context).backgroundColor,
                  appBar: AppBar(
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Theme.of(context).backgroundColor,
                      statusBarBrightness:
                          MediaQuery.of(context).platformBrightness ==
                                  Brightness.light
                              ? Brightness.light
                              : Brightness.dark,
                      statusBarIconBrightness:
                          MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? Brightness.light
                              : Brightness.dark,
                    ),
                    title: InkWell(
                        onTap: () {
                          Get.to(() => search(), fullscreenDialog: true);
                        },
                        child: const SizedBox(
                            width: double.maxFinite,
                            child: AutoSizeText(
                              "Live Streaming",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ))),
                    centerTitle: true,
                    titleTextStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 18.0),
                    iconTheme: IconThemeData(
                        color: Theme.of(context).textTheme.bodyText1?.color),
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    leading: _widgets.profileButton(
                        context: context,
                        profileImageURL:
                            userController.user.profileImage.isNotEmpty
                                ? userController.user.profileImage
                                : _dummyProfilePictureURL,
                        personalProfile: true),
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(50.0),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Divider(
                              height: 0.0,
                              thickness: 0.5,
                              color: Colors.grey,
                            ),
                          ),
                          TabBar(
                            labelColor:
                                Theme.of(context).textTheme.bodyText1?.color,
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: const [
                              Tab(
                                text: "Movies",
                              ),
                              Tab(
                                text: "Video Games",
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      _widgets.newMovieButton(context: context),
                      _widgets.wheelButton(context: context),
                      _widgets.cartButton(context: context,cartSize: 0),
                    ],
                  ),
                  body: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Movies(
                        movies: movieController.movies,
                      ),
                      videoGames(),
                    ],
                  ),
                );
              },
            );
          },
        ));
  }
}
