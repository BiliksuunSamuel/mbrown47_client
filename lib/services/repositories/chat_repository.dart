import 'package:get/get.dart';
import 'package:glory/services/api/api_client.dart';

class ChatRepository extends GetxService {
  final ApiClient apiClient;
  ChatRepository({required this.apiClient});

  Future<Response> postMethod(String url, dynamic data) async {
    try {
      return await apiClient.postRequest(url, data);
    } catch (error) {
      return Response(statusCode: 404, statusText: error.toString());
    }
  }

  Future<Response> getMethod(String url) async {
    try {
      return await apiClient.getRequest(url);
    } catch (error) {
      return Response(statusCode: 404, statusText: error.toString());
    }
  }
}
