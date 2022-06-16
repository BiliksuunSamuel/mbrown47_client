import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:glory/models/song_model.dart';
import 'package:glory/routes/routes.dart';

class RelatedMusicTile extends StatefulWidget {
  final SongModel relatedSong;
  const RelatedMusicTile({Key? key, required this.relatedSong})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<RelatedMusicTile> createState() =>
      // ignore: no_logic_in_create_state
      _RelatedMusicTileState(relatedSong: relatedSong);
}

class _RelatedMusicTileState extends State<RelatedMusicTile> {
  final SongModel relatedSong;
  Duration duration = Duration.zero;
  final AudioPlayer player = AudioPlayer();
  _RelatedMusicTileState({required this.relatedSong}) {
    init();
  }

  void init() async {
    try {
      Source source = UrlSource(Routes.appBaseUrl + relatedSong.source);
      await player.setSource(source);
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    player.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        foregroundImage: NetworkImage(Routes.appBaseUrl + relatedSong.cover),
      ),
      title: Text(
        relatedSong.title,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(fontSize: 14.0, fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(relatedSong.artist,
          style:
              Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12.0),
          overflow: TextOverflow.ellipsis),
      trailing: Text(
        duration.toString().split(":")[1] +
            ":" +
            double.parse(duration.toString().split(":")[2]).toStringAsFixed(0),
        style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12.0),
      ),
    );
  }
}
