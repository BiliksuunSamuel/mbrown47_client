import 'package:get/get.dart';
import 'package:glory/models/story_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/repositories/posts_repository.dart';

class PostsController extends GetxController {
  final PostsRepository postsRepository;

  PostsController({required this.postsRepository});
   List<StoryModel> posts = [];
  Future<void> getPosts() async {
    Response response = await postsRepository.getPosts(Routes.postsGet);
    if (response.statusCode == 200) {
      posts = response.body;
    } else {
      print(response.statusText);
    }
  }

}
