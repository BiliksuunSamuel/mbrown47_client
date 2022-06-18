import 'package:glory/data/params/new_story_comment_info.dart';
import 'package:glory/data/params/new_story_info.dart';
import 'package:glory/models/story_comment_model.dart';
import 'package:glory/models/story_model.dart';

Map<String, dynamic> formatStoryInfo(NewStoryInfo info) {
  Map<String, dynamic> data = {
    "title": info.title,
    "message": info.message,
    "media": info.media,
    "userId": info.userId,
    "mediaType": info.mediaType,
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

dynamic prepareCommentInfo(NewStoryCommentInfo info) {
  return {
    "userId": info.userId,
    "comment": info.comment,
    "dateAdded": info.dateAdded,
    "storyId": info.storyId,
    "likes": info.likes,
    "replies": info.replies,
    "id": info.id,
  };
}

dynamic prepareStoryCommentLikeInfo(
    StoryModel model, String userId, StoryCommentModel comment) {
  List<StoryCommentModel> comments = model.comments;
  List<StoryCommentModel> data = [];

  for (StoryCommentModel mod in comments) {
    if (mod.id == comment.id) {
      if (mod.likes.contains(userId)) {
        mod.likes.remove(userId);
        data.add(mod);
      } else {
        mod.likes.add(userId);
        data.add(mod);

      }
    } else {
      data.add(mod);
    }
  }
  return {
    "id": model.id,
    "comments": data,
  };
}

StoryModel getStoryById(List<StoryModel> stories, String id) {
  return stories.where((element) => element.id == id).first;
}
