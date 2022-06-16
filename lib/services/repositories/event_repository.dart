import 'package:get/get.dart';
import 'package:glory/services/api/api_client.dart';

class EventRepository extends GetxService {
  final ApiClient apiClient;

  EventRepository({required this.apiClient});

  Future<Response> getEvents(String url) async {
    try {
      return await apiClient.getRequest(url);
    } catch (error) {
      return Response(statusCode: 404, statusText: error.toString());
    }
  }

  Future<Response> postRequest(String url, dynamic data) async {
    try {
      return await apiClient.postRequest(url, data);
    } catch (error) {
      return Response(statusCode: 404, statusText: error.toString());
    }
  }

  //handle delete event;
}
