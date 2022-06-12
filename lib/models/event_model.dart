class EventModel {
  late String id;
  late String title;
  late String subtitle;
  late double cost;
  late String about;
  late String contactPhone;
  late String contactEmail;
  late String dateAdded;
  late String userId;
  late List<dynamic> registeredUsers;
  late String poster;

  EventModel.fromJson(dynamic json) {
    id = json["_id"];
    title = json["title"];
    subtitle = json["subtitle"];
    cost = double.parse(json["cost"].toString());
    about = json["about"];
    contactEmail = json["contactEmail"];
    contactPhone = json["contactPhone"];
    dateAdded = json["dateAdded"];
    userId = json["userId"];
    registeredUsers = json["registeredUsers"] as List<dynamic>;
    poster = json["poster"];
  }
}
