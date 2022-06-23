import 'dart:convert';

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
  return {"_id": info.id, "likes": likes};
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

Map<String, dynamic> formatStoryCommentLikeInfo(
    String userId, StoryCommentModel model) {
  return {"userId": userId, "storyId": model.storyId, "commentId": model.id};
}

List<StoryModel> getMyStories(List<StoryModel> stories, String userId) {
  List<StoryModel> myStories = [];
  for (StoryModel story in stories) {
    if (story.userId == userId) {
      myStories.add(story);
    }
  }
  return myStories;
}

List<StoryModel> getOtherStories(List<StoryModel> stories, String userId) {
  List<StoryModel> otherStories = [];

  for (StoryModel story in stories) {
    if (story.userId != userId) {
      otherStories.add(story);
    }
  }
  return otherStories;
}
