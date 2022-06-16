import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glory/models/song_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/controllers/songs_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class MusicPlayerControllers extends StatelessWidget {
  final AudioPlayer player;
  final SongModel song;
  const MusicPlayerControllers(
      {Key? key, required this.player, required this.song})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      return GetBuilder<SongsController>(builder: (songsController) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              child: Icon(
                Icons.skip_previous_rounded,
                color: Theme.of(context).textTheme.bodyText1?.color,
                size: 30.0,
              ),
              onTap: () {},
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Theme.of(context).primaryColor.withOpacity(0.5)),
              padding: const EdgeInsets.all(10.0),
              height: 80.0,
              width: 80.0,
              child: FloatingActionButton(
                onPressed: () async {
                  if (songsController.playing) {
                    await player.pause();
                    songsController.handlePlayerState();
                  } else {
                    await player.resume();
                    songsController.handlePlayerState();
                  }
                },
                child: Icon(
                  songsController.playing
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 35.0,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
            InkWell(
              child: Icon(
                Icons.skip_next_rounded,
                color: Theme.of(context).textTheme.bodyText1?.color,
                size: 30.0,
              ),
              onTap: () {},
            ),
          ],
        );
      });
    });
  }
}
