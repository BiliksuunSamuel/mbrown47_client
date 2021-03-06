import 'package:get/get.dart';
import 'package:glory/Utils/format_eventInfo.dart';
import 'package:glory/data/params/new_event_info.dart';
import 'package:glory/models/event_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/repositories/event_repository.dart';

class EventsController extends GetxController {
  final EventRepository eventRepository;
  String message = "";
  String error = "";
  bool loading = false;
  List<EventModel> events = [];
  List<String> cart = [];
  NewEventInfo info = NewEventInfo();
  EventsController({required this.eventRepository});

  @override
  void onInit() {
    getEvents();
    super.onInit();
  }

  void getEvents() async {
    try {
      Response response = await eventRepository.getEvents(Routes.eventsGet);
      if (response.statusCode == 200 || response.statusCode == 201) {
        events = formatEvents(response.body);
        loading = false;
        update();
      }
    } catch (err) {
      update();
    }
  }

  void addEvent() async {
    Response response = await eventRepository.postRequest(
        Routes.eventAdd, formatEventInfo(info));
    if (response.statusCode == 200 || response.statusCode == 201) {
      message = response.body;
      loading = false;
      info = NewEventInfo();
      update();
    } else {
      error = response.statusText.toString();
      loading = false;
      update();
    }
  }

  void handleEventCart(String eventId) {
    if (cart.contains(eventId)) {
      cart.remove(eventId);
      update();
    } else {
      cart.add(eventId);
      update();
    }
  }

  //handle delete event
  void handleDeleteEvent(String eventId, String coverPath) async {
    try {
      Map<String, dynamic> data = {"id": eventId, "path": coverPath};
      Response response =
          await eventRepository.postRequest(Routes.deleteEvent, data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        message = response.body;
        update();
      } else {
        error = response.statusText.toString();
      }
    } catch (err) {
      update();
    }
  }

  void updateEventInfo(dynamic data) async {
    try {
      Response response =
          await eventRepository.postRequest(Routes.eventUpdate, data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        events = formatEvents(response.body);
        update();
      }
    } catch (err) {
      error = err.toString();
      update();
    }
  }
}
