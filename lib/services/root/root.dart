import 'package:get/get.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/api/api_client.dart';
import 'package:glory/services/controllers/books_controller.dart';
import 'package:glory/services/controllers/event_controller.dart';
import 'package:glory/services/controllers/movies_controller.dart';
import 'package:glory/services/controllers/posts_controller.dart';
import 'package:glory/services/controllers/songs_controller.dart';
import 'package:glory/services/controllers/story_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';
import 'package:glory/services/repositories/books_repository.dart';
import 'package:glory/services/repositories/event_repository.dart';
import 'package:glory/services/repositories/movies_repository.dart';
import 'package:glory/services/repositories/posts_repository.dart';
import 'package:glory/services/repositories/songs_repository.dart';
import 'package:glory/services/repositories/story_repository.dart';
import 'package:glory/services/repositories/user_repository.dart';

Future<void> initializeDependencies() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: Routes.appBaseUrl));
  //repositories
  Get.lazyPut(() => UserRepository(apiClient: Get.find()));
  Get.lazyPut(() => SongsRepository(apiClient: Get.find()));
  Get.lazyPut(() => PostsRepository(apiClient: Get.find()));
  Get.lazyPut(() => SongsRepository(apiClient: Get.find()));
  Get.lazyPut(() => MoviesRepository(apiClient: Get.find()));
  Get.lazyPut(() => BooksRepository(apiClient: Get.find()));
  Get.lazyPut(() => StoryRepository(apiClient: Get.find()));
  Get.lazyPut(() => EventRepository(apiClient: Get.find()));

//controllers;
  Get.lazyPut(() => UserController(userRepository: Get.find()));
  Get.lazyPut(() => SongsController(songsRepository: Get.find()));
  Get.lazyPut(() => BooksController(booksRepository: Get.find()));
  Get.lazyPut(() => MoviesController(moviesRepository: Get.find()));
  Get.lazyPut(() => PostsController(postsRepository: Get.find()));
  Get.lazyPut(() => StoryController(storyRepository: Get.find()));
  Get.lazyPut(() => EventsController(eventRepository: Get.find()));
}
