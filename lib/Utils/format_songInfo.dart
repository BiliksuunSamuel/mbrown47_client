import 'package:glory/models/song_model.dart';

Map<String, dynamic> prepareSongLikeInfo(SongModel info, String userId) {
  List<dynamic> likes = info.likes;
  if (likes.contains(userId)) {
    likes.remove(userId);
  } else {
    likes.add(userId);
  }

  return {
    "id": info.id,
    "likes": likes,
  };
}
