import 'package:get/get.dart';
import 'package:glory/services/api/api_client.dart';

class UserRepository extends GetxService {
  final ApiClient apiClient;
  UserRepository({required this.apiClient});

  Future<Response> getData(String url) async {
    return await apiClient.getRequest(url);
  }

  Future<Response> postData(String url, dynamic data) async {
    Response response = await apiClient.postRequest(url, data);
    return response;
  }

  Future<Response> getUsers(String url) async {
    return await apiClient.getRequest(url);
  }
}
