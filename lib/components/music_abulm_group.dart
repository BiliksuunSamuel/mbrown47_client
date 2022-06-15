import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:glory/models/song_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/screens/subScreens/musicPlayer.dart';
import 'package:glory/services/controllers/songs_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class MusicAbulmGroup extends StatelessWidget {
  final List<SongModel> songs;
    SongsController songsController =
      SongsController(songsRepository: Get.find());
  UserController userController = UserController(userRepository: Get.find());
   MusicAbulmGroup({Key? key, required this.songs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 2,
          child: ListView.builder(
              itemCount:songs.isNotEmpty
                  ? songs.length - 1
                  : 0,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                      Get.to(
                          () => musicPlayer(
                                file: songs[index],
                              ),
                          transition: Transition.size);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: NetworkImage(Routes.appBaseUrl+songs[index].cover),
                              fit: BoxFit.cover)),
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.width / 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:  [
                              Text(
                                songs[index].title,
                                overflow: TextOverflow.ellipsis,
                                style:const TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                              Text(
                                songs[index].artist,
                                overflow: TextOverflow.ellipsis,
                                style:const TextStyle(
                                    fontSize: 12.0, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
              }),
        );
  }
}
