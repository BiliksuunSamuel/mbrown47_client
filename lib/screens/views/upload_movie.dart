import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/components/custom_button.dart';
import 'package:glory/components/custom_input.dart';
import 'package:glory/components/dropdown_field.dart';
import 'package:glory/constants/app_colors.dart';
import 'package:glory/data/data.dart';
import 'package:glory/services/controllers/movies_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AddMovieScreen extends StatelessWidget {
  const AddMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoviesController>(builder: (moviesController) {
      if (moviesController.loading) {
        context.loaderOverlay.show();
      }
      return GetBuilder<UserController>(builder: (userController) {
        return LoaderOverlay(
            overlayWholeScreen: true,
            useDefaultLoading: false,
            overlayColor: Colors.white,
            overlayOpacity: 1,
            overlayWidget: const SpinKitCircle(
              color: Colors.green,
              size: 50,
            ),
            child: Scaffold(
              backgroundColor: AppColors.white,
              body: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.topCenter,
                  child: Center(
                      child: Column(
                    children: [
                      const Text("Movie Details"),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomInput(
                          hint: "Enter Title",
                          label: "Title",
                          handleChanged: (text) {
                            moviesController.info.title = text;
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      DropdownInput(
                        title: "Category",
                        data: formatDropdownInputData(Data.moviesCategories),
                        hint: "choose movie category",
                        value: moviesController.info.category,
                        handleChange: (text) {
                          moviesController.handleCategory(text);
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomInput(
                        handleChanged: (text) {
                          moviesController.info.tag = text;
                        },
                        hint: "Tag",
                        label: "Tag",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        onChanged: (text) {
                          moviesController.info.description = text;
                        },
                        maxLines: 5,
                        style: const TextStyle(
                          height: 1.5,
                        ),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          hintText: "Description",
                          labelText: "Description",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomButton(
                        title: "Release Date",
                        elevated: false,
                        handlePressed: () {
                          Color color = Theme.of(context).primaryColor;
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(1018, 3, 5),
                              maxTime: DateTime(2019, 6, 7),
                              theme: DatePickerTheme(
                                  headerColor: Colors.orange,
                                  backgroundColor: color,
                                  itemStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  doneStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16)),
                           onConfirm: (date) {
                            moviesController.info.releasedDate = date.toString();
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en);
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomButton(
                          title: "Choose Cover Image",
                          elevated: false,
                          handlePressed: () async {
                            FilePickerResult? results =
                                await FilePicker.platform.pickFiles(
                              allowMultiple: false,
                              type: FileType.image,
                              dialogTitle: "Choose The Cover Image",
                              withData: true,
                            );
                            if (results != null && results.files.isNotEmpty) {
                              moviesController.info.coverImage =
                                  base64Encode(results.files.first.bytes!);
                            }
                          }),
                      CustomButton(
                          title: "Choose Trailer Video",
                          elevated: false,
                          handlePressed: () async {
                            FilePickerResult? results =
                                await FilePicker.platform.pickFiles(
                              dialogTitle: "Choose Movie Trailer",
                              allowMultiple: false,
                              type: FileType.video,
                              withData: true,
                            );
                            if (results != null && results.files.isNotEmpty) {
                              moviesController.info.trailerUrl =
                                  base64Encode(results.files.first.bytes!);
                            }
                          }),
                      CustomButton(
                          title: "Choose Movie File",
                          elevated: false,
                          handlePressed: () async {
                            FilePickerResult? results =
                                await FilePicker.platform.pickFiles(
                                    allowMultiple: false,
                                    type: FileType.video,
                                    withData: true,
                                    dialogTitle: "Choose Movie File");
                            if (results != null && results.files.isNotEmpty) {
                              moviesController.info.sourceUrl =
                                  base64Encode(results.files.first.bytes!);
                              moviesController.info.size =
                                  results.files.first.size / (1024 * 1024);
                              moviesController.info.userId =
                                  userController.user.id;
                            }
                          }),
                      CustomButton(
                          title: "Upload",
                          elevated: true,
                          handlePressed: moviesController.uploadMovie),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        moviesController.error,
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ),
                      Text(
                        moviesController.message,
                        style:
                            const TextStyle(color: Colors.green, fontSize: 14),
                      ),
                    ],
                  )),
                ),
              ),
            ));
      });
    });
  }
}
