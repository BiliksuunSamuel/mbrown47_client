class StoryCommentModel {
  late String storyId;
  late String userId;
  late String comment;
  late String dateAdded;
  late List<dynamic> likes;
  late List<dynamic> replies;
  late String id;

  StoryCommentModel.fromJson(dynamic data) {
    storyId = data["storyId"];
    userId = data["userId"];
    comment = data["comment"];
    dateAdded = data["dateAdded"];
    likes = data["likes"] as List<dynamic>;
    replies = data["replies"] as List<dynamic>;
    id = data["id"];
  }
}
