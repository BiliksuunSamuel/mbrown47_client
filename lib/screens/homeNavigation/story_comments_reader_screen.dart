import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/components/story_comment_view.dart';
import 'package:glory/models/story_model.dart';
import 'package:glory/screens/views/reply_story_view.dart';
import 'package:glory/services/controllers/story_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class StoryCommentReaderScreen extends StatelessWidget {
  final StoryModel story;
  final ScrollController controller = ScrollController();
  StoryCommentReaderScreen({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => UserController(userRepository: Get.find()));
    return GetBuilder<UserController>(builder: (userController) {
      Get.lazyPut(() => StoryController(storyRepository: Get.find()));
      return GetBuilder<StoryController>(builder: (storyController) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor:Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor:Theme.of(context).primaryColor,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness:Brightness.light,

            ),
            title: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Story Replies",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () =>
                            Get.off(() => ReplyStoryView(story: story)),
                        iconSize: 20,
                        color: Colors.white,
                        icon: const Icon(Icons.add_comment))
                  ],
                ),
              ),),
          body: Container(
            margin: const EdgeInsets.all(0),
            child: Column(children: [              
              Expanded(child: 
              SingleChildScrollView(child: 
              ListView.builder(
                  controller: controller,
                  itemCount: story.comments.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(2),
                      child: Column(children: [
                        StoryCommentView(comment: story.comments[index])
                      ]),
                    );
                  }),))
            ]),
          ),
        );
      });
    });
  }
}
