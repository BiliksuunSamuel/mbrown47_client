import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/format_storyInfo.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/models/story_comment_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/controllers/story_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class StoryCommentView extends StatelessWidget {
  final StoryCommentModel comment;
  const StoryCommentView({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      Get.lazyPut(() => UserController(userRepository: Get.find()));
      return GetBuilder<StoryController>(builder: (storyController) {
        Get.lazyPut(() => StoryController(storyRepository: Get.find()));
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(Routes.appBaseUrl +
                              getProfileImage(getUserById(
                                  userController.users, comment.userId)))),
                      borderRadius: BorderRadius.circular(45)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(getUserById(userController.users, comment.userId).username,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis)),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                comment.comment,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              margin: const EdgeInsets.all(0),
              child: Row(
                children: [
                  // InkWell(
                  //   onTap: () {},
                  //   child: SizedBox(
                  //       child: Row(children: [
                  //       const Icon(Icons.comment_outlined,size:18),
                  //     Text(comment.replies.length.toString(),
                  //         style: const TextStyle(
                  //             fontSize: 15, fontWeight: FontWeight.bold))
                  //   ])),
                  // ),
                  // const SizedBox(
                  //   width: 10,
                  // ),
                  InkWell(
                    onTap: () => storyController.handleCommentUpdate(
                        formatStoryCommentLikeInfo(
                            userController.user.id, comment)),
                    child: SizedBox(
                        child: Row(children: [
                       Icon(
                         
                              comment.likes.contains(userController.user.id)
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color:
                                  comment.likes.contains(userController.user.id)
                                      ? Colors.red
                                      : Colors.grey,
                          size: 18,
                        ),
                      Text(comment.likes.length.toString(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
                    ])),
                  )
                ],
              ),
            ),
          ]),
        );
      });
    });
  }
}
