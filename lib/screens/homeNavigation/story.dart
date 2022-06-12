import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/cWidgets.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/components/photo_story.dart';
import 'package:glory/components/text_story_view.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/controllers/story_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';
import 'package:glory/view/video_story_view.dart';

class story extends StatelessWidget {
  final cWidgets _widgets = cWidgets();
  @override
  Widget build(BuildContext context) {
    StoryController(storyRepository: Get.find()).getStories();
    return DefaultTabController(
        length: 2,
        child: GetBuilder<UserController>(builder: (userController) {
          return GetBuilder<StoryController>(builder: (storyController) {
            storyController.getStories();
            return Scaffold(
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
                      profileImageURL:Routes.appBaseUrl+ getProfileImage(userController.user),
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
                    // IconButton(
                    //     onPressed: () {},
                    //     splashColor: Theme.of(context).primaryColor,
                    //     splashRadius: 20.0,
                    //     icon: ImageIcon(
                    //       AssetImage('assets/images/spin_wheel.png'),
                    //       color: Colors.white,
                    //     )),
                    // IconButton(
                    //     onPressed: () {},
                    //     splashColor: Theme.of(context).primaryColor,
                    //     splashRadius: 20.0,
                    //     icon: ImageIcon(
                    //       AssetImage('assets/images/cart_bag.png'),
                    //       color: Colors.white,
                    //     )),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      PageView.builder(
                        itemCount: storyController.stories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return storyController.stories[index].mediaType=="text"?
                           TextStoryView(story: storyController.stories[index]):
                           storyController.stories[index].mediaType=="photo"?
                           PhotoStoryView(story: storyController.stories[index]):
                           VideoStoryView(
                              story: storyController.stories[index]
                            );
                        },
                        scrollDirection: Axis.vertical,
                      ),
                      PageView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return storyController.stories[index].mediaType=="text"?
                           TextStoryView(story: storyController.stories[index]):
                           VideoStoryView(
                              story: storyController.stories[index]
                            );
                        },
                        itemCount: storyController.stories.length,
                        scrollDirection: Axis.vertical,
                      ),
                    ],
                  ),
                )
                // Stack(
                //   children: [
                //     Align(
                //       alignment: FractionalOffset.center,
                //       child: PageView.builder(itemBuilder: (BuildContext context, int index){
                //         return Container();
                //       }),
                //     )
                //   ],
                // ),
                );
          });
        }));
  }
}
