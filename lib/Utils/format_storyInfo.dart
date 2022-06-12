
import 'package:glory/data/params/new_story_info.dart';
import 'package:glory/models/story_model.dart';

Map<String, dynamic> formatStoryInfo(NewStoryInfo info) {
  Map<String, dynamic> data = {
    "title": info.title,
    "message": info.message,
    "media": info.media,
    "userId": info.userId,
    "mediaType":info.mediaType,
  };
  return data;
}

Map<String, dynamic> formatStoryUpdateInfo(StoryModel info, String userId) {
  bool isLiked = info.likes.contains(userId);
  List<dynamic> likes = info.likes;
  if (isLiked) {
    likes.remove(userId);
  } else {
    likes.add(userId);
  }
  Map<String, dynamic> data = {
    "_id": info.id,
    "userId": info.userId,
    "message": info.message,
    "title": info.title,
    "likes": likes,
    "comments": info.comments,
    "shares": info.shares,
    "dateAdded": info.dateAdded,
    "media": info.media,
  };
  return data;
}

List<StoryModel> formatStories(List<dynamic> data) {
  List<StoryModel> stories = [];
  for (dynamic json in data) {
    stories.add(StoryModel.fromJson(json));
  }
  return stories;
}
