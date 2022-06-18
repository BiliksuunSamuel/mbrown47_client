import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/components/custom_button.dart';
import 'package:glory/components/response_label.dart';
import 'package:glory/components/textarea.dart';
import 'package:glory/models/story_model.dart';
import 'package:glory/services/controllers/story_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class ReplyStoryView extends StatelessWidget {
  final StoryModel story;
  const ReplyStoryView({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => UserController(userRepository: Get.find()));
    return GetBuilder<UserController>(builder: (userController) {
      Get.lazyPut(() => StoryController(storyRepository: Get.find()));
      return GetBuilder<StoryController>(builder: (storyController) {
        storyController.error = "";
        storyController.message = "";
        return SafeArea(
            child: Scaffold(
          body: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
                child: Column(
              children: [
                Text(
                    "Replying to Story By: " +
                        getUserById(userController.users, story.userId)
                            .username,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                TextArea(
                    hint: "Reply",
                    handleChange: (text) {
                      storyController.commentInfo.comment = text;
                    },
                    label: "Enter Reply",
                    numberOflines: 4),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                    title: "Submit Reply",
                    elevated: false,
                    handlePressed: () {
                      storyController.commentInfo.userId =
                          userController.user.id;
                      storyController.commentInfo.storyId = story.id;
                      storyController.addComment();
                    }),
                const SizedBox(
                  height: 15,
                ),
                storyController.message.isNotEmpty
                    ? ResponseLabel(
                        text: storyController.message, isError: false)
                    : Container(),
                storyController.error.isNotEmpty
                    ? ResponseLabel(text: storyController.error, isError: true)
                    : Container(),
              ],
            )),
          ),
        ));
      });
    });
  }
}
