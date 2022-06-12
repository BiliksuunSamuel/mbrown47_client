import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/cWidgets.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/screens/subScreens/messages/chat.dart';
import 'package:glory/services/controllers/user_controller.dart';

class profile extends StatelessWidget {
  final cWidgets _widgets = cWidgets();
  bool personalProfile;
  bool isFollowed = true;
  final String profileImageURL;
  profile({Key? key, required this.personalProfile,required this. profileImageURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return personalProfile
        ? DefaultTabController(
            length: 2,
            child: GetBuilder<UserController>(
              builder: (userController) {
                return Scaffold(
                  backgroundColor: Theme.of(context).backgroundColor,
                  extendBodyBehindAppBar: false,
                  appBar: AppBar(
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Theme.of(context).backgroundColor,
                      statusBarBrightness:
                          MediaQuery.of(context).platformBrightness ==
                                  Brightness.light
                              ? Brightness.light
                              : Brightness.dark,
                      statusBarIconBrightness:
                          MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? Brightness.light
                              : Brightness.dark,
                    ),
                    title: InkWell(
                        onTap: () {},
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                userController.user.username,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color,
                              )
                            ])),
                    centerTitle: true,
                    iconTheme: IconThemeData(
                        color: Theme.of(context).textTheme.bodyText1?.color),
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
                    actions: [
                      _widgets.wheelButton(context: context),
                      _widgets.cartButton(context: context,cartSize: 0),
                    ],
                  ),
                  body: SingleChildScrollView(
                    primary: true,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40.0,
                              child: ClipOval(
                                child:
                                    Image(image: NetworkImage(profileImageURL)),
                              )),
                        ),
                        Text(
                          "@" + userController.user.username,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 14.0),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: _widgets.profilePageStats(
                              context: context,
                              totalFollowers: calculateFollowers(
                                      userController.user.followers)
                                  .toString(),
                              totalFollowing: getFollowing(userController.users,
                                      userController.user.id)
                                  .toString(),
                              // totalLikes: "91",
                              onTapFollowers: () {},
                              onTapFollowing: () {},
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            OutlinedButton(
                                onPressed: () {},
                                child: const Text(
                                  "Edit Profile",
                                ),
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all<BorderSide>(
                                      const BorderSide(
                                          width: 1.0, color: Colors.grey)),
                                  textStyle:
                                      MaterialStateProperty.all<TextStyle>(
                                          const TextStyle(
                                    fontFamily: 'Poppins',
                                  )),
                                  foregroundColor: MaterialStateProperty.all(
                                      Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.color),
                                )),
                            const Padding(
                                padding: EdgeInsets.only(right: 10.0)),
                            OutlinedButton(
                                onPressed: () {},
                                child: const Icon(Icons.bookmark_outline),
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all<BorderSide>(
                                      const BorderSide(
                                          width: 1.0, color: Colors.grey)),
                                  foregroundColor: MaterialStateProperty.all(
                                      Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.color),
                                )),
                          ],
                        ),
                        TabBar(
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Theme.of(context).primaryColor,
                          enableFeedback: true,
                          onTap: (index) {},
                          tabs: [
                            Tab(
                              icon: Icon(
                                Icons.calendar_today_rounded,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color,
                              ),
                            ),
                            Tab(
                              icon: Icon(
                                Icons.favorite_outline_rounded,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 1.2,
                          width: MediaQuery.of(context).size.width,
                          child: TabBarView(
                              physics: const BouncingScrollPhysics(),
                              children: [
                                GridView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 2.0,
                                      crossAxisSpacing: 2.0,
                                      childAspectRatio: 9 / 16,
                                    ),
                                    itemCount: 20,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Image.asset(
                                        'assets/images/sample_image.png',
                                        fit: BoxFit.cover,
                                      );
                                    }),
                                GridView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 2.0,
                                      crossAxisSpacing: 2.0,
                                      childAspectRatio: 9 / 16,
                                    ),
                                    itemCount: 5,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Image.asset(
                                        'assets/images/sample_image.png',
                                        fit: BoxFit.cover,
                                      );
                                    }),
                              ]),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : GetBuilder<UserController>(builder: (userController) {
            return Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              extendBodyBehindAppBar: false,
              appBar: AppBar(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Theme.of(context).backgroundColor,
                  statusBarBrightness:
                      MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? Brightness.light
                          : Brightness.dark,
                  statusBarIconBrightness:
                      MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Brightness.light
                          : Brightness.dark,
                ),
                title: InkWell(
                    onTap: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            userController.user.username,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Theme.of(context).textTheme.bodyText1?.color,
                          )
                        ])),
                centerTitle: true,
                iconTheme: IconThemeData(
                    color: Theme.of(context).textTheme.bodyText1?.color),
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
                actions: [
                  _widgets.wheelButton(context: context),
                  _widgets.cartButton(context: context,cartSize: 0),
                ],
              ),
              body: SingleChildScrollView(
                primary: true,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40.0,
                          child: ClipOval(
                            child: Container(
                                alignment: Alignment.center,
                                child: Image(
                                  image: NetworkImage(Routes.appBaseUrl +
                                      userController.user.profileImage),
                                )),
                          )),
                    ),
                    Text(
                      "@" + userController.user.username,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 14.0),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: _widgets.profilePageStats(
                          context: context,
                          totalFollowers:
                              calculateFollowers(userController.user.followers)
                                  .toString(),
                          totalFollowing: getFollowing(
                                  userController.users, userController.user.id)
                              .toString(),
                          // totalLikes: "91",
                          onTapFollowers: () {},
                          onTapFollowing: () {},
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        OutlinedButton(
                            onPressed: () => isFollowed
                                ? Get.to(() => chat(),
                                    transition: Transition.size)
                                : () {},
                            child: isFollowed
                                ? const Text(
                                    "Message",
                                  )
                                : const Text("Follow"),
                            style: ButtonStyle(
                              side: MaterialStateProperty.all<BorderSide>(
                                  const BorderSide(
                                      width: 1.0, color: Colors.grey)),
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                  const TextStyle(
                                fontFamily: 'Poppins',
                              )),
                              foregroundColor: MaterialStateProperty.all(
                                  Theme.of(context).textTheme.bodyText1?.color),
                            )),
                        const Padding(padding: EdgeInsets.only(right: 10.0)),
                        OutlinedButton(
                            onPressed: () {},
                            child:
                                const Icon(Icons.keyboard_arrow_down_rounded),
                            style: ButtonStyle(
                              side: MaterialStateProperty.all<BorderSide>(
                                  const BorderSide(
                                      width: 1.0, color: Colors.grey)),
                              foregroundColor: MaterialStateProperty.all(
                                  Theme.of(context).textTheme.bodyText1?.color),
                            )),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10.0)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 2.0,
                            crossAxisSpacing: 2.0,
                            childAspectRatio: 9 / 16,
                          ),
                          itemCount: 20,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Image.asset(
                              'assets/images/sample_image.png',
                              fit: BoxFit.cover,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            );
          });
  }
}
