import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/models/story_model.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/screens/subScreens/profile.dart';
import 'package:glory/screens/subScreens/storyMusicProfile.dart';
import 'package:glory/services/controllers/user_controller.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

// class VideoStoryView extends StatelessWidget {

//   final StoryModel story;
//    VideoStoryView({Key? key, required this.story}) : super(key: key);

// }

class VideoStoryView extends StatefulWidget {
  final StoryModel story;
  const VideoStoryView({Key? key, required this.story}) : super(key: key);

  @override
  State<VideoStoryView> createState() => _VideoStoryViewState(story: story);
}

class _VideoStoryViewState extends State<VideoStoryView> {
  final StoryModel story;
  final StoryController storyController = StoryController();
  _VideoStoryViewState({required this.story});

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Align(
                alignment: FractionalOffset.center,
                child: StoryView(
                  progressPosition: ProgressPosition.bottom,
                  onComplete: () {
                    print("story completed");
                  },
                  controller: storyController,
                  repeat: false,
                  storyItems: [
                    StoryItem.pageVideo(
                        Routes.appBaseUrl+story.media.first,
                        shown: true,
                        key:Key("story-play-controller-glory"+story.id),
                        imageFit: BoxFit.contain,
                        controller: storyController),
                    
                  ],
                )),
            Align(
                alignment: FractionalOffset.bottomLeft,
                child: Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: 180.0,
                    padding: const EdgeInsets.only(bottom: 75.0, left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          story.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          story.message,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12.0),
                        ),
                      ],
                    ))),
            Align(
              alignment: FractionalOffset.bottomRight,
              child: Container(
                width: 80.0,
                padding:
                    const EdgeInsets.only(top: 100.0, bottom: 75.0, right: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(
                            () => profile(
                                  personalProfile: false,
                                  profileImageURL: Routes.appBaseUrl +
                                      getProfileImage(userController.user),
                                ),
                            transition: Transition.circularReveal,
                            fullscreenDialog: true);
                      },
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(Routes.appBaseUrl +
                                  getProfileImage(userController.user)),
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(width: 0.5, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 70,
                        width: 45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  storyController.play();
                                },
                                icon: const Icon(
                                  Icons.play_circle_outline_rounded,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 70,
                        width: 45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  // storyController.updateStoryInfo(
                                  //     formatStoryUpdateInfo(
                                  //         story, userController.user.id));
                                },
                                icon: Icon(
                                  story.likes.contains(userController.user.id)
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: story.likes
                                          .contains(userController.user.id)
                                      ? Colors.redAccent
                                      : Colors.white,
                                  size: 30.0,
                                )),
                            Text(
                              calculateLikes(story.likes).toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 10.0),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 60,
                        width: 45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.comment_outlined,
                              color: Colors.white,
                              size: 25.0,
                            ),
                            Text(
                              calculateTotalComments(story.comments).toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10.0),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 60,
                        width: 45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 25.0,
                            ),
                            Text(
                              "Share",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.0),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15.0),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => storyMusicProfile(),
                            transition: Transition.circularReveal,
                            fullscreenDialog: true);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade800,
                        child: const Icon(
                          Icons.multitrack_audio_outlined,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        radius: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}