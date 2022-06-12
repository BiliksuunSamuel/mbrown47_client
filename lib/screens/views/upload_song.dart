import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/components/custom_input.dart';
import 'package:glory/components/response_label.dart';
import 'package:glory/constants/app_colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:glory/services/controllers/songs_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';
import '../subScreens/search.dart';

class AddSongScreen extends StatefulWidget {
  const AddSongScreen({Key? key}) : super(key: key);

  @override
  State<AddSongScreen> createState() => _AddSongScreenState();
}

class _AddSongScreenState extends State<AddSongScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SongsController>(builder: (songController) {
      return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).backgroundColor,
              statusBarBrightness:
                  MediaQuery.of(context).platformBrightness == Brightness.light
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
                      "Upload Music",
                      textAlign: TextAlign.left,
                      maxLines: 1,
                    ))),
            centerTitle: true,
            titleTextStyle:
                Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18.0),
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
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
          body: Container(
            padding: const EdgeInsets.all(5),
            child: Column(children: [
              CustomInput(
                  hint: "Song Title",
                  label: "Enter Song Title",
                  handleChanged: (text) => songController.file.title = text),
              CustomInput(
                  hint: "Artist",
                  label: "Enter Artist Name",
                  handleChanged: (text) => songController.file.artist = text),
              CustomInput(
                  hint: "Song Category",
                  label: "Enter Song Category",
                  handleChanged: (text) => songController.file.category = text),
              CustomInput(
                  hint: "Song Description",
                  label: "Enter Song Description",
                  handleChanged: (text) =>
                      songController.file.description = text),
              CustomInput(
                  hint: "Album",
                  label: "Enter Album Name",
                  handleChanged: (text) => songController.file.album = text),
              CustomInput(
                  hint: "Lyrics",
                  label: "Enter Lyrics",
                  handleChanged: (text) => songController.file.lyrics = text),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child: OutlinedButton(
                            onPressed: songController.resModel.loading
                                ? null
                                : () async {
                                    FilePickerResult? results =
                                        await FilePicker.platform.pickFiles(
                                            dialogTitle: "Choose Music File",
                                            type: FileType.audio,
                                            withData: true,
                                            allowMultiple: false);
                                    setState(() {
                                      if (results != null &&
                                          results.files.isNotEmpty) {
                                        songController.file.source =
                                            base64Encode(
                                                results.files.first.bytes!);
                                      }
                                    });
                                  },
                            child: const Text("Choose File"))),
                  ]),
              Row(
                children: [
                  GetBuilder<UserController>(builder: (userController) {
                    return Expanded(
                        child: OutlinedButton(
                      onPressed: songController.resModel.loading
                          ? null
                          : () async {
                              FilePickerResult? file = await FilePicker.platform
                                  .pickFiles(
                                      allowMultiple: false,
                                      dialogTitle: "Choose Cover Image",
                                      withData: true,
                                      type: FileType.image);
                              if (file != null && file.files.isNotEmpty) {
                                songController.file.userId =
                                    userController.user.id;
                                songController.file.cover =
                                    base64Encode(file.files.first.bytes!);
                              }
                            },
                      child: const Text("Choose Cover Image"),
                    ));
                  })
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: songController.resModel.loading
                        ? () {}
                        : songController.uploadSong,
                    child: const Text("Submit"),
                  ))
                ],
              ),
              songController.resModel.error.isNotEmpty
                  ? ResponseLabel(
                      text: songController.resModel.error, isError: true)
                  : Container(),
              songController.resModel.message.isNotEmpty
                  ? ResponseLabel(
                      text: songController.resModel.message, isError: false)
                  : Container(),
            ]),
          ));
    });
  }
}
