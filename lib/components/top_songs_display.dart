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

class TopSongsDisplay extends StatelessWidget {
  final List<SongModel> songs;
  const TopSongsDisplay({Key? key, required this.songs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      return GetBuilder<SongsController>(builder: (songController) {
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: songs.isNotEmpty
                ? songs.length
                : 0,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  Get.to(
                      () => musicPlayer(
                            file: songs[index],
                          ),
                      transition: Transition.size);
                },
                dense: true,
                leading: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: NetworkImage(Routes.appBaseUrl +
                              songs[index].cover),
                          fit: BoxFit.cover)),
                ),
                title: Text(
                  songs[index].title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  songs[index].artist,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text(
                  "5:30",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              );
            });
      });
    });
  }
}
