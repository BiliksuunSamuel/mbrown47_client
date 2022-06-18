import 'package:glory/models/story_comment_model.dart';

class StoryModel {
  late String message;
  late List<dynamic> media;
  late List<dynamic> likes = [];
  late List<StoryCommentModel> comments = [];
  late List<dynamic> shares = [];
  late String userId;
  late String dateAdded;
  late String id;
  late String title;
  late String mediaType;

  StoryModel.fromJson(dynamic json) {
    message = json["message"];
    media = json["media"] as List<dynamic>;
    likes = json["likes"] as List<dynamic>;
    shares = json["shares"] as List<dynamic>;
    userId = json["userId"];
    id = json["_id"];
    dateAdded = json["dateAdded"];
    title = json["title"];
    comments = formatComments(json["comments"] as List<dynamic>);
    mediaType = json["mediaType"].toString();
  }

  List<StoryCommentModel> formatComments(List<dynamic> data) {
    List<StoryCommentModel> results = [];
    for (dynamic info in data) {
      results.add(StoryCommentModel.fromJson(info));
    }
    return results;
  }
}
