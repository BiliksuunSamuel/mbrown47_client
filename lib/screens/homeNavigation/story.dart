import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/cWidgets.dart';
import 'package:glory/Utils/format_storyInfo.dart';
import 'package:glory/components/photo_story.dart';
import 'package:glory/components/text_story_view.dart';
import 'package:glory/models/story_model.dart';
import 'package:glory/services/controllers/story_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';
import 'package:glory/view/video_story_view.dart';

class story extends StatelessWidget {
  final cWidgets _widgets = cWidgets();
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    context = context;
    Get.lazyPut(() => StoryController(storyRepository: Get.find()));
    StoryController(storyRepository: Get.find()).getStories();
    return GetBuilder<UserController>(builder: (userController) {
      userController.getUsers();
      return GetBuilder<StoryController>(builder: (storyController) {
        storyController.getStories();
        return DefaultTabController(
            length: 2,
            child: Scaffold(
                backgroundColor: Colors.black,
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Colors.black,
                    statusBarBrightness: Brightness.dark,
                    statusBarIconBrightness: Brightness.light,
                  ),
                  title: Text(
                    userController.user.username,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0),
                  ),
                  centerTitle: false,
                  iconTheme: const IconThemeData(color: Colors.white),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  leading: _widgets.profileButton(
                      context: context,
                      user: userController.user,
                      personalProfile: true),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(50.0),
                    child: SizedBox(
                      width: 150.0,
                      child: TabBar(
                        unselectedLabelStyle: const TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Poppins',
                        ),
                        labelStyle: const TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Poppins',
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.grey,
                        tabs: const [
                          Tab(
                            text: "Following",
                          ),
                          Tab(
                            text: "For You",
                          ),
                        ],
                        indicator: const UnderlineTabIndicator(
                          borderSide:
                              BorderSide(width: 0.0, color: Colors.transparent),
                        ),
                        indicatorSize: TabBarIndicatorSize.label,
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        labelPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  actions: [
                    _widgets.addStoryButton(context: context),
                    IconButton(
                      onPressed: () {},
                      splashColor: Theme.of(context).primaryColor,
                      splashRadius: 20.0,
                      icon: const Icon(
                        Icons.search_outlined,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        splashColor: Theme.of(context).primaryColor,
                        splashRadius: 20.0,
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        )),
                  ],
                ),
                body: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        PageView.builder(
                          itemCount: getOtherStories(storyController.stories,
                                  userController.user.id)
                              .length,
                          itemBuilder: (BuildContext context, int index) {
                            List<StoryModel> stories = getOtherStories(
                                storyController.stories,
                                userController.user.id);
                            StoryModel story = stories[index];
                            return stories[index].mediaType ==
                                    "text"
                                ? TextStoryView(
                                    story: story,
                                    userController: userController,
                                    storyController: storyController,
                                  )
                                : story.mediaType == "photo"
                                    ? PhotoStoryView(
                                        story: story,
                                        userController: userController,
                                        storyController: storyController,
                                      )
                                    : VideoStoryView(story: story);
                          },
                          scrollDirection: Axis.vertical,
                        ),
                        PageView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            List<StoryModel> stories = getMyStories(
                                storyController.stories,
                                userController.user.id);
                            StoryModel story = stories[index];
                            return stories[index].mediaType ==
                                    "text"
                                ? TextStoryView(
                                    story: story,
                                    userController: userController,
                                    storyController: storyController,
                                  )
                                : story.mediaType == "photo"
                                    ? PhotoStoryView(
                                        story: story,
                                        userController: userController,
                                        storyController: storyController,
                                      )
                                    : VideoStoryView(story: story);
                          },
                          itemCount: getMyStories(storyController.stories,
                                  userController.user.id)
                              .length,
                          scrollDirection: Axis.vertical,
                        ),
                      ],
                    ))));
      });
    });
  }
}
