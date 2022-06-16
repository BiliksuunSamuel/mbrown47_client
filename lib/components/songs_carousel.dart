import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glory/models/song_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/screens/subScreens/musicPlayer.dart';
import 'package:glory/services/controllers/songs_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class SongsCarousel extends StatelessWidget {
  final List<SongModel> songs;
    SongsController songsController =
      SongsController(songsRepository: Get.find());
  UserController userController = UserController(userRepository: Get.find());
   SongsCarousel({Key? key, required this.songs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 2,
          margin: const EdgeInsets.only(top: 10.0),
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
            ),
            items: songs.isNotEmpty
                ? songs.map((song) {
                    return Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => MusicPlayer(file: song),
                                transition: Transition.size);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        Routes.appBaseUrl + song.cover),
                                    fit: BoxFit.cover)),
                          ),
                        );
                      },
                    );
                  }).toList()
                : [],
          ),
        );
  }
}
