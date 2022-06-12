import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  final String appBaseUrl;
  late Map<String, String> header;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout =const Duration(seconds: 60, hours: 24, minutes: 60);
    header = {
      "ContentType": "application/json",
    };
  }

  Future<Response> getRequest(String url) async {
    try {
      return await get(url);
    } catch (error) {
      return Response(statusCode: 404, statusText: error.toString());
    }
  }

  Future<Response> postRequest(String url, dynamic data) async {
    try {
      Response response = await post(url, data);
      return response;
    } catch (error) {
      return Response(statusCode: 404, statusText: error.toString());
    }
  }
}
