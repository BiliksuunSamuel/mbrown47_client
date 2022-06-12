class StoryModel {
  late String message;
  late List<dynamic> media;
  late List<dynamic> likes = [];
  late List<dynamic> comments = [];
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
    comments = json["comments"] as List<dynamic>;
    mediaType = json["mediaType"].toString();
  }
}
