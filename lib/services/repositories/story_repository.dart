import 'package:get/get.dart';
import 'package:glory/services/api/api_client.dart';

class StoryRepository extends GetxService {
  final ApiClient apiClient;
  StoryRepository({required this.apiClient});

  Future<Response> getStories(String url) async {
    return await apiClient.getRequest(url);
  }

  Future<Response> addStory(String url, dynamic data) async {
    return apiClient.postRequest(url, data);
  }

  Future<Response> updateStoryInfo(String url, dynamic data) async {
    return await apiClient.postRequest(url, data);
  }
}
