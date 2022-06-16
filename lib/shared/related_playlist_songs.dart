import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glory/models/song_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/controllers/songs_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class RelatedPlaylistSongs extends StatelessWidget {
  final SongModel file;
  const RelatedPlaylistSongs({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      return GetBuilder<SongsController>(builder: (songsController) {
        return Container(
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? Colors.grey.shade100
              : Colors.grey.shade900,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 50.0),
            itemCount: songsController.songs.length,
            itemBuilder: (BuildContext context, int index) {
              SongModel relatedSong = songsController.songs[index];
              return ListTile(
                dense: true,
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade800,
                  foregroundImage:
                      NetworkImage(Routes.appBaseUrl + relatedSong.cover),
                ),
                title: Text(
                  relatedSong.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 14.0, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(file.artist,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontSize: 12.0),
                    overflow: TextOverflow.ellipsis),
                trailing: Text(
                  "5:00",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontSize: 12.0),
                ),
              );
            },
          ),
        );
      });
    });
  }
}
