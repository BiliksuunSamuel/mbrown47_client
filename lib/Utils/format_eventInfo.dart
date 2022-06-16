import 'package:glory/data/params/new_event_info.dart';
import 'package:glory/models/event_model.dart';

Map<String, dynamic> formatEventInfo(NewEventInfo info) {
  return {
    "title": info.title,
    "subtitle": info.subtitle,
    "cost": info.cost,
    "poster": info.poster,
    "contactPhone": info.contactPhone,
    "contactEmail": info.contactEmail,
    "userId": info.userId,
    "about": info.about
  };
}

List<EventModel> formatEvents(List<dynamic> data) {
  List<EventModel> events = [];
  for (dynamic event in data) {
    events.add(EventModel.fromJson(event));
  }
  return events;
}

List<EventModel> filterRecommendedEvent(
    List<EventModel> events, String eventId) {
  List<EventModel> data = [];
  for (EventModel event in events) {
    if (event.id != eventId) {
      data.add(event);
    }
  }
  return data;
}

Map<String, dynamic> prepareEventLikeInfo(EventModel info, String userId) {
  List<dynamic> likes = info.likes;
  if (likes.contains(userId)) {
    likes.remove(userId);
  } else {
    likes.add(userId);
  }
  return {
    "id": info.id,
     "likes":likes,
  };
}
