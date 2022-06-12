import 'package:get/get.dart';
import 'package:glory/services/api/api_client.dart';

class BooksRepository extends GetxService {
  final ApiClient apiClient;
  BooksRepository({required this.apiClient});

  Future<Response> getBooks(String url) async {
    try {
      return apiClient.getRequest(url);
    } catch (error) {
      return Response(statusCode: 404, statusText: error.toString());
    }
  }

  Future<Response> addNewBook(dynamic data, String url) async {
    try {
      return await apiClient.postRequest(url, data);
    } catch (error) {
      return Response(statusCode: 404, statusText: error.toString());
    }
  }
}
