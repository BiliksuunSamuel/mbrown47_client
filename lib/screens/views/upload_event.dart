import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/components/custom_button.dart';
import 'package:glory/components/custom_input.dart';
import 'package:glory/components/textarea.dart';
import 'package:glory/constants/app_colors.dart';
import 'package:glory/services/controllers/event_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';
import 'package:glory/services/repositories/event_repository.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => EventRepository(apiClient: Get.find()));
    return GetBuilder<UserController>(builder: (userController) {
      return GetBuilder<EventsController>(builder: (eventController) {
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
              title: const InkWell(
                  child: SizedBox(
                      width: double.maxFinite,
                      child: AutoSizeText(
                        "Add Event",
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
            body:SingleChildScrollView(child:  Container(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  CustomInput(
                      hint: "Event Title",
                      label: "enter event title",
                      handleChanged: (text) =>
                          eventController.info.title = text),
                  const SizedBox(height: 15,),
                  CustomInput(
                      hint: "Event Subtitle",
                      label: "enter event subtitle",
                      handleChanged: (text) =>
                          eventController.info.subtitle = text),
                  const SizedBox(height: 15,),
                  CustomInput(
                      hint: "Event Cost",
                      label: "enter cost",
                      handleChanged: (text) =>
                          eventController.info.cost = double.parse(text)),
                  const SizedBox(height: 15,),
                  TextArea(
                      hint: "about event",
                      handleChange: (text) {
                        eventController.info.about = text;
                      },
                      label: "About Event",
                      numberOflines: 8),
                  const SizedBox(height: 15,),
                  CustomButton(
                      title: "Choose Event Poster",
                      elevated: false,
                      handlePressed: () async {
                        FilePickerResult? results =
                            await FilePicker.platform.pickFiles(
                          type: FileType.image,
                          dialogTitle: "Choose Event Poster",
                          withData: true,
                          allowMultiple: false,
                          allowCompression: true,
                        );
                        if (results != null && results.files.isNotEmpty) {
                          eventController.info.poster =
                              base64Encode(results.files.first.bytes!);
                          eventController.info.userId =
                              userController.user.id;
                        }
                      }),
                  const SizedBox(height: 15,),
                  CustomButton(
                      title: "Submit",
                      elevated: true,
                      handlePressed: () {
                        eventController.addEvent();
                      }),

                  const SizedBox(height: 15,),
                  Text(eventController.error),
                  const SizedBox(height: 15,),
                  Text(eventController.message),
                ]))),);
      });
    });
  }
}
