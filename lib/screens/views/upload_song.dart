import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/components/custom_button.dart';
import 'package:glory/components/custom_input.dart';
import 'package:glory/components/response_label.dart';
import 'package:glory/constants/app_colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:glory/services/controllers/songs_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AddSongScreen extends StatefulWidget {
  const AddSongScreen({Key? key}) : super(key: key);

  @override
  State<AddSongScreen> createState() => _AddSongScreenState();
}

class _AddSongScreenState extends State<AddSongScreen> {
  _AddSongScreenState({Key? key});
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      context.loaderOverlay.show();
    }
    return GetBuilder<UserController>(builder: (userController) {
      Get.lazyPut(() => SongsController(songsRepository: Get.find()));
      return GetBuilder<SongsController>(builder: (songController) {
        return SafeArea(
            child: Scaffold(
                backgroundColor: AppColors.white,
                body: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(top: 50),
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    height: context.height,
                    child: Center(
                        child: Column(
                      children: [
                        const Text(
                          "Song Details",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomInput(
                            hint: "Song Title",
                            label: "Enter Song Title",
                            handleChanged: (text) =>
                                songController.file.title = text),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomInput(
                            hint: "Artist",
                            label: "Enter Artist Name",
                            handleChanged: (text) =>
                                songController.file.artist = text),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomInput(
                            hint: "Song Category",
                            label: "Enter Song Category",
                            handleChanged: (text) =>
                                songController.file.category = text),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomInput(
                            hint: "Song Description",
                            label: "Enter Song Description",
                            handleChanged: (text) =>
                                songController.file.description = text),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomInput(
                            hint: "Album",
                            label: "Enter Album Name",
                            handleChanged: (text) =>
                                songController.file.album = text),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomInput(
                            hint: "Lyrics",
                            label: "Enter Lyrics",
                            handleChanged: (text) =>
                                songController.file.lyrics = text),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomButton(
                          title: "Choose File",
                          elevated: false,
                          handlePressed: () async {
                            FilePickerResult? results =
                                await FilePicker.platform.pickFiles(
                                    dialogTitle: "Choose Music File",
                                    type: FileType.audio,
                                    withData: true,
                                    allowMultiple: false);
                            if (results != null && results.files.isNotEmpty) {
                              songController.file.source =
                                  base64Encode(results.files.first.bytes!);
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomButton(
                          title: "Choose Cover Image",
                          elevated: false,
                          handlePressed: () async {
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
                        ),
                        CustomButton(
                            title: "Submit",
                            elevated: true,
                            handlePressed: () {
                              setState(() {
                                loading = true;
                              });
                              songController.uploadSong();
                              setState(() {
                                loading = songController.resModel.loading;
                              });
                            }),
                        Text(
                          songController.resModel.message,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          songController.resModel.error,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                  ),
                )));
      });
    });
  }
}
