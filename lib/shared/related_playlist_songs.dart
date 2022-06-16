import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/format_songInfo.dart';
import 'package:glory/models/song_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/controllers/songs_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';
import 'package:glory/shared/related_music_tile.dart';
import 'package:just_audio/just_audio.dart';

class RelatedPlaylistSongs extends StatelessWidget {
  final SongModel file;
  final AudioPlayer player = AudioPlayer();
  RelatedPlaylistSongs({Key? key, required this.file}) : super(key: key);

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
            itemCount: getRelatedSongs(songsController.songs, file.id).length,
            itemBuilder: (BuildContext context, int index) {
              SongModel relatedSong = getRelatedSongs(songsController.songs, file.id)[index];
              return RelatedMusicTile(relatedSong: relatedSong);
            },
          ),
        );
      });
    });
  }
}
