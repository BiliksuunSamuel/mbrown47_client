import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/components/custom_button.dart';
import 'package:glory/components/custom_input.dart';
import 'package:glory/components/dropdown_field.dart';
import 'package:glory/components/textarea.dart';
import 'package:glory/constants/app_colors.dart';
import 'package:glory/data/data.dart';
import 'package:glory/services/controllers/story_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

import '../subScreens/search.dart';

class AddStoryScreen extends StatelessWidget {
  const AddStoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => StoryController(storyRepository: Get.find()));
    return GetBuilder<UserController>(builder: (userController) {
      return GetBuilder<StoryController>(builder: (storyController) {
        return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Theme.of(context).backgroundColor,
                statusBarBrightness:
                    MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? Brightness.light
                        : Brightness.dark,
                statusBarIconBrightness:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? Brightness.light
                        : Brightness.dark,
              ),
              title: InkWell(
                  onTap: () {
                    Get.to(() => search(), fullscreenDialog: true);
                  },
                  child: const SizedBox(
                      width: double.maxFinite,
                      child: AutoSizeText(
                        "Add Story",
                        textAlign: TextAlign.left,
                        maxLines: 1,
                      ))),
              centerTitle: true,
              titleTextStyle: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontSize: 18.0),
              iconTheme: const IconThemeData(color: Colors.black),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              // leading: _widgets.profileButton(context: context, profileImageURL: _dummyAlbum[0], personalProfile: true),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(2.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Divider(
                    height: 0.0,
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Column(children: [
                      const SizedBox(height: 15),
                      DropdownInput(
                          title: "Story Type",
                          data: Data.storyContentType,
                          hint: "select story type",
                          value: storyController.info.mediaType,
                          handleChange: (text) {
                            storyController.info.mediaType = text;
                            storyController
                                .handleNewStoryInfo(storyController.info);
                          }),
                      const SizedBox(height: 15),
                      CustomInput(
                          hint: "Enter Story Title",
                          label: "Title",
                          handleChanged: (text) {
                            storyController.info.title = text;
                            storyController
                                .handleNewStoryInfo(storyController.info);
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      TextArea(
                          hint: "Enter Message",
                          handleChange: (text) {
                            storyController.info.message = text;
                            storyController
                                .handleNewStoryInfo(storyController.info);
                          },
                          label: "Message",
                          numberOflines: 5),
                      const SizedBox(
                        height: 15,
                      ),
                      storyController.info.mediaType != "text"
                          ? CustomButton(
                              title: "Choose File",
                              elevated: false,
                              handlePressed: storyController.loading
                                  ? () {}
                                  : () async {
                                      FilePickerResult? results =
                                          await FilePicker.platform.pickFiles(
                                        allowMultiple: true,
                                        withData: true,
                                      );
                                      if (results != null &&
                                          results.files.isNotEmpty) {
                                        for (PlatformFile file
                                            in results.files) {
                                          storyController.info.media
                                              .add(base64Encode(file.bytes!));
                                        }
                                      }
                                      storyController.handleNewStoryInfo(
                                          storyController.info);
                                    },
                            )
                          : Container(),
                      CustomButton(
                          title: "Submit",
                          elevated: true,
                          handlePressed: storyController.loading
                              ? () {}
                              : () {
                                  storyController.info.userId =
                                      userController.user.id;
                                  storyController.addStory();
                                }),
                      const SizedBox(
                        height: 10,
                      ),
                      storyController.error!=null? Text(storyController.error,
                          style: const TextStyle(color: Colors.red)):Container(),
                      storyController.message!=null? Text(storyController.message,
                          style: const TextStyle(color: Colors.green)):Container(),
                    ]))));
      });
    });
  }
}
