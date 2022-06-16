import 'package:get/get.dart';
import 'package:glory/services/api/api_client.dart';

class SongsRepository extends GetxService {
  final ApiClient apiClient;
  SongsRepository({required this.apiClient});

  Future<Response> getSongs(String url) async {
    try {
      return await apiClient.getRequest(url);
    } catch (error) {
      return Response(statusCode: 404, statusText: error.toString());
    }
  }

  Future<Response> postRequest(dynamic data, String url) async {
    try {
      return await apiClient.postRequest(url, data);
    } catch (error) {
      return Response(statusText: error.toString(), statusCode: 404);
    }
  }
}
