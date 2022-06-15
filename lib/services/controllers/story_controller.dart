import 'package:get/get.dart';
import 'package:glory/Utils/format_storyInfo.dart';
import 'package:glory/data/params/new_story_info.dart';
import 'package:glory/models/story_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/repositories/story_repository.dart';

class StoryController extends GetxController {
  final StoryRepository storyRepository;
  StoryController({required this.storyRepository});
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
      Response response = await storyRepository.getStories(Routes.storiesGet);
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
    Response response =
        await storyRepository.addStory(Routes.storyAdd, formatStoryInfo(info));
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
    Map<String, dynamic> info = {"_id": "7704", "userId": "7704"};
    Response response =
        await storyRepository.updateStoryInfo(Routes.storyUpdate, data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      stories = response.body;
    }
  }

  void handleNewStoryInfo(NewStoryInfo data) {
    info = data;
    update();
  }
}
