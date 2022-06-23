import 'package:get/get.dart';
import 'package:glory/Utils/format_storyInfo.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/data/params/new_story_comment_info.dart';
import 'package:glory/data/params/new_story_info.dart';
import 'package:glory/models/story_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/repositories/story_repository.dart';

class StoryController extends GetxController {
  final StoryRepository storyRepository;
  StoryController({required this.storyRepository});
  NewStoryCommentInfo commentInfo = NewStoryCommentInfo();
  List<StoryModel> stories = [];
  NewStoryInfo info = NewStoryInfo();
  String error = "";
  String message = "";
  bool loading = false;

  @override
  void onInit() {
    getStories();
    super.onInit();
  }

  void getStories() async {
    try {
      Response response = await storyRepository.getRequest(Routes.storiesGet);
      if (response.statusCode == 200 || response.statusCode == 201) {
        stories = formatStories(response.body);
        update();
      } else {
        error = response.body;
      }
    } catch (err) {
      error = err.toString();
      update();
    }
  }

  void addStory() async {
    loading = true;
    message = "";
    error = "";
    Response response = await storyRepository.postRequest(
        Routes.storyAdd, formatStoryInfo(info));
    if (response.statusCode == 200 || response.statusCode == 201) {
      message = response.body;
      info = NewStoryInfo();
      getStories();
      update();
    } else {
      error = response.body;
      update();
    }
    loading = false;
  }

  void updateStoryInfo(Map<String, dynamic> data) async {
    try {
      Response response =
          await storyRepository.postRequest(Routes.storyUpdate, data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        stories = response.body;
      }
    } catch (err) {
      print(err);
      error = err.toString();
      update();
    }
  }

  void handleNewStoryInfo(NewStoryInfo data) {
    info = data;
    update();
  }

  void addComment() async {
    try {
      Response response = await storyRepository.postRequest(
          Routes.storyReply, prepareCommentInfo(commentInfo));
      if (response.statusCode == 200 || response.statusCode == 201) {
        stories = formatStories(response.body["data"]);
        message = response.body["message"];
        update();
      } else {
        error = response.body;
        update();
      }
    } catch (err) {
      error = err.toString();
      update();
    }
  }

  void handleCommentUpdate(dynamic data) async {
    try {
      Response response =
          await storyRepository.postRequest(Routes.storyCommentUpdate, data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        stories = formatStories(response.body);
        update();
      } else {
        error = response.body.toString();
        update();
      }
      update();
    } catch (e) {
      error = e.toString();
      update();
    }
  }
}
