// ignore_for_file: unnecessary_getters_setters

import 'package:get/get.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/data/params/new_music_info.dart';
import 'package:glory/models/response_model.dart';
import 'package:glory/models/song_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/api/api_client.dart';
import 'package:glory/services/repositories/songs_repository.dart';

class SongsController extends GetxController {
  late ApiClient apiClient;
  final SongsRepository songsRepository;
  late List<SongModel> songs = [];
  late bool playing = false;
  late Duration duration = const Duration(minutes: 0, seconds: 0);
  ResponseModel resModel = ResponseModel();
  NewMusicInfo file = NewMusicInfo();
  SongsController({required this.songsRepository});

  @override
  void onInit() {
    getSongs();
    super.onInit();
  }

  void uploadSong() async {
    Map<String, dynamic> data = {
      "title": file.title,
      "cover": file.cover,
      "artist": file.artist,
      "source": file.source,
      "size": file.size,
      "userId": "",
      "description": file.description,
      "album": file.album,
      "category": file.category,
    };
    resModel.error = "";

    Response response =
        await songsRepository.uploadSong(data, Routes.songUpload);
    if (response.statusCode == 200 || response.statusCode == 201) {
      resModel.message = response.body;
      file = NewMusicInfo();
      update();
    } else {
      resModel.error = response.body.toString();
      update();
    }
  }

  void getSongs() async {
    try {
      Response response = await songsRepository.getSongs(Routes.songsGet);
      if (response.statusCode == 200 || response.statusCode == 201) {
        songs = formatSongsInfo(response.body);
        update();
      } else {
        resModel.error = response.statusText.toString();
        update();
      }
    } catch (err) {
      print(err);
    }
  }

  void handlePlayerState() {
    playing = !playing;
    update();
  }

  void handleSongDuration(Duration duration) {
    duration = duration;
    update();
  }
}
