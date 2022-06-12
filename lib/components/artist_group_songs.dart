import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glory/models/song_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/screens/subScreens/musicPlayer.dart';
import 'package:glory/services/controllers/songs_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class ArtistGroupSongs extends StatelessWidget {
  final List<SongModel> songs;
  const ArtistGroupSongs({Key? key,required this.songs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      return GetBuilder<SongsController>(builder: (songController) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 2,
          child: ListView.builder(
              itemCount:songs.isNotEmpty? songs.length-1:0,
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
                  child: Column(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  image: NetworkImage(Routes.appBaseUrl+songs[index].cover),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              songs[index].title,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontSize: 14.0,
                                  ),
                            ),
                            Text(
                              songs[index].artist,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                    fontSize: 12.0,
                                  ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
        );
      });
    });
  }
}
