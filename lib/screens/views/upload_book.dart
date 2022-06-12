// ignore_for_file: unnecessary_const, avoid_print


import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/components/custom_button.dart';
import 'package:glory/components/custom_input.dart';
import 'package:glory/components/dropdown_field.dart';
import 'package:glory/components/response_label.dart';
import 'package:glory/components/textarea.dart';
import 'package:glory/constants/app_colors.dart';
import 'package:glory/data/data.dart';
import 'package:glory/services/controllers/books_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

import '../subScreens/search.dart';

class UploadBookScreen extends StatelessWidget {
  const UploadBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BooksController(booksRepository: Get.find()));
    Get.lazyPut(() => UserController(userRepository: Get.find()));
    return GetBuilder<BooksController>(builder: (bookController) {
      return GetBuilder<UserController>(builder: (userController) {
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
                      "Upload Book",
                      textAlign: TextAlign.left,
                      maxLines: 1,
                    ))),
            centerTitle: true,
            titleTextStyle:
                Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18.0),
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            // leading: _widgets.profileButton(context: context, profileImageURL: _dummyAlbum[0], personalProfile: true),
          ),
          body: Center(
              child: Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.topCenter,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
              const SizedBox(
                height: 8,
              ),
              CustomInput(
                  hint: "Enter Book Title",
                  label: "Book Title",
                  handleChanged: (e) {
                    bookController.newBookInfo.title = e;
                  }),
              const SizedBox(
                height: 8,
              ),
              CustomInput(
                hint: "Enter Author Name",
                label: "Author",
                handleChanged: (text) =>
                    bookController.newBookInfo.author = text,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomInput(
                hint: "Enter Category",
                label: "Book Category",
                handleChanged: (text) =>
                    bookController.newBookInfo.category = text,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomInput(
                hint: "Enter Tag",
                label: "Tag",
                handleChanged: (text) => bookController.newBookInfo.tag = text,
              ),
              const SizedBox(
                height: 8,
              ),
              DropdownInput(
                data: Data.bookIndex,title: "Display Group",
                hint: "Select Display Group",
                value: bookController.newBookInfo.index.toString(),
                handleChange: ((text){
                bookController.newBookInfo.index=int.parse(text);
              }),),
              const SizedBox(
                height: 8,
              ),
              DropdownInput(
                data: Data.bookPricing,title: "Payment Status",
                hint: "Select Payment Group",
                value: bookController.newBookInfo.paid.toString(),
                handleChange: ((text){
                bookController.newBookInfo.paid=int.parse(text);
              }),),
              const SizedBox(
                height: 8,
              ),
              TextArea(hint: "Enter Description", handleChange: (text){
                bookController.newBookInfo.description=text;
              }, label: "Description", numberOflines: 3),
              const SizedBox(
                height: 8,
              ),
              CustomInput(
                hint: "Enter Cost",
                label: "Cost: \$0",
                handleChanged: (text) => bookController.newBookInfo.cost =
                    double.parse(text.toString()),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomButton(
                title: "Choose Cover Image",
                elevated: false,
                handlePressed: bookController.rm.loading
                    ? () {}
                    : () async {
                        FilePickerResult? results = await FilePicker.platform
                            .pickFiles(
                                allowMultiple: false,
                                type: FileType.image,
                                withData: true,
                                dialogTitle: "Choose Book Title");
                        if (results != null && results.files.isNotEmpty) {
                          bookController.newBookInfo.cover =
                              base64Encode(results.files.first.bytes!);
                        }
                      },
              ),
              const SizedBox(
                height: 8,
              ),
              CustomButton(
                title: "Submit",
                elevated: true,
                handlePressed: bookController.rm.loading
                    ? () {}
                    : () {
                        bookController.addBook();
                      },
              ),
              bookController.rm.error.isNotEmpty
                  ? ResponseLabel(
                      text: bookController.rm.error,
                      isError: true,
                    )
                  : Container(),
              bookController.rm.message.isNotEmpty
                  ? ResponseLabel(
                      text: bookController.rm.message,
                      isError: false,
                    )
                  : Container(),
            ]),
          )),
        );
      });
    });
  }
}
