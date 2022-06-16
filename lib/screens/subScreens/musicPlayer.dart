// ignore: file_names

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/format_songInfo.dart';
import 'package:glory/models/song_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/controllers/songs_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';
import 'package:glory/shared/custom_icon_button.dart';
import 'package:glory/shared/music_player_controllers.dart';
import 'package:glory/shared/related_playlist_songs.dart';
import 'package:glory/shared/tag_label_display.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:seekbar/seekbar.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class MusicPlayer extends StatefulWidget {
  final SongModel file;
  final AudioPlayer player = AudioPlayer();
  MusicPlayer({Key? key, required this.file}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<MusicPlayer> createState() =>
      // ignore: no_logic_in_create_state
      _MusicPlayerState(file: file, player: player);
}

class _MusicPlayerState extends State<MusicPlayer> {
  final SongModel file;
  final AudioPlayer player;
  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  List<SongModel> songs = [];

  _MusicPlayerState({required this.file, required this.player}) {
    _init();
  }

  @override
  void initState() {
    super.initState();
    //
    player.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
    //
    player.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    player.onPlayerComplete.listen((event) {});
  }

  void _init() async {
    try {
      Source source = UrlSource(Routes.appBaseUrl + file.source);
      await player.setSource(source);
    } catch (error) {
      print(error);
    }
  }

  @override
  void dispose() async {
    player.dispose();
    super.dispose();
  }

  final SolidController _bottomSheetController = SolidController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      return GetBuilder<SongsController>(builder: (songsController) {
        return Scaffold(
            extendBodyBehindAppBar: true,
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
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? Brightness.light
                        : Brightness.dark,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              iconTheme: IconThemeData(
                  color: Theme.of(context).textTheme.bodyText1?.color),
              title: const AutoSizeText(
                "Listening",
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
              centerTitle: true,
              titleTextStyle: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontSize: 18.0),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert_outlined,
                    ))
              ],
            ),
            body: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Align(
                      alignment: FractionalOffset.topCenter,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 6,
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 100.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.7,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    Routes.appBaseUrl + file.cover,
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: SolidBottomSheet(
                            controller: _bottomSheetController,
                            // elevation: 100.0,
                            maxHeight: MediaQuery.of(context).size.height / 2,
                            headerBar: Card(
                              margin: const EdgeInsets.all(0.0),
                              color:
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.light
                                      ? Colors.grey.shade100
                                      : Colors.grey.shade900,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0)),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 50.0,
                                      child: Divider(
                                        color: Colors.grey,
                                        thickness: 3.0,
                                      ),
                                    ),
                                    ListTile(
                                        dense: true,
                                        title: Text(
                                          file.title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.copyWith(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                          file.artist,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.copyWith(fontSize: 12.0),
                                        ),
                                        trailing: IconButton(
                                          icon: Icon(Icons.favorite_outline,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  ?.color),
                                          splashColor:
                                              Theme.of(context).primaryColor,
                                          splashRadius: 20.0,
                                          onPressed: () {},
                                        )),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 30.0,
                                        right: 30.0,
                                      ),
                                      child: Column(
                                        children: [
                                          SeekBar(
                                            onProgressChanged: (value) async {
                                              final pos = Duration(
                                                  seconds: value.toInt());
                                              setState(() {
                                                position = pos;
                                              });
                                              await player.seek(position);
                                              // await player.resume();
                                            },
                                            value: (position.inSeconds
                                                    .toDouble() /
                                                duration.inSeconds.toDouble()),
                                            progressColor:
                                                Theme.of(context).primaryColor,
                                            thumbColor:
                                                Theme.of(context).primaryColor,
                                            barColor: Theme.of(context)
                                                .textTheme
                                                .bodyText2
                                                ?.color,
                                            progressWidth: 3.5,
                                          ),
                                          Row(children: [
                                            Text(
                                              position
                                                      .toString()
                                                      .split(":")[1] +
                                                  ":" +
                                                  double.parse(position
                                                          .toString()
                                                          .split(":")[2])
                                                      .toStringAsFixed(0),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  ?.copyWith(fontSize: 14.0),
                                            ),
                                            const Spacer(),
                                            Text(
                                              duration
                                                      .toString()
                                                      .split(":")[1] +
                                                  ":" +
                                                  double.parse(duration
                                                          .toString()
                                                          .split(":")[2])
                                                      .toStringAsFixed(0),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  ?.copyWith(fontSize: 14.0),
                                            ),
                                          ]),
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(top: 5.0)),
                                          MusicPlayerControllers(
                                            player: player,
                                            song: file,
                                          ),
                                          const Divider(),
                                          //
                                          Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TagLabelDisplay(
                                                    label: "Likes",
                                                    value: file.likes.length
                                                        .toString()),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                CustomIconButton(
                                                    iconColor: file.likes
                                                            .contains(
                                                                userController
                                                                    .user.id)
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.black,
                                                    handlePress: () {
                                                      songsController
                                                          .handleSongInfoUpdate(
                                                              prepareSongLikeInfo(
                                                                  file,
                                                                  userController
                                                                      .user
                                                                      .id));
                                                    },
                                                    buttonIcon: file.likes
                                                            .contains(
                                                                userController
                                                                    .user.id)
                                                        ? Icons.thumb_up
                                                        : Icons
                                                            .thumb_up_alt_outlined),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            body: RelatedPlaylistSongs(
                              file: file,
                            ))),
                  ],
                ),
              ),
            ));
      });
    });
  }
}
