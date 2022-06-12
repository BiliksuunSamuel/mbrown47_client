import 'package:get/get.dart';
import 'package:glory/services/api/api_client.dart';

class PostsRepository extends GetxService {
  final ApiClient apiClient;
  PostsRepository({required this.apiClient});

  Future<Response>getPosts(String url)async{
    try{
      return await apiClient.getRequest(url);
    }catch(error){
      return Response(statusCode: 404,statusText: error.toString());
    }
  }
}
