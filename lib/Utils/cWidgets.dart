import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glory/screens/subScreens/cart.dart';
import 'package:glory/screens/subScreens/profile.dart';
import 'package:glory/screens/subScreens/search.dart';
import 'package:glory/screens/subScreens/spin/spinWheel.dart';
import 'package:glory/screens/views/upload_book.dart';
import 'package:glory/screens/views/upload_event.dart';
import 'package:glory/screens/views/upload_movie.dart';
import 'package:glory/screens/views/upload_song.dart';
import 'package:glory/screens/views/upload_story.dart';

class cWidgets {
  Widget profilePageStats({
    required BuildContext context,
    required String totalFollowers,
    required String totalFollowing,
    // required String totalLikes,
    required onTapFollowers,
    required onTapFollowing,
    // required onTapLikes,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(
          flex: 2,
        ),
        InkWell(
          onTap: onTapFollowers,
          child: Column(children: [
            Text(
              totalFollowers,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Followers",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontSize: 12.0),
            )
          ]),
        ),
        const Spacer(
          flex: 1,
        ),
        InkWell(
          onTap: onTapFollowing,
          child: Column(children: [
            Text(
              totalFollowing,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Following",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontSize: 12.0),
            )
          ]),
        ),
        const Spacer(
          flex: 1,
        ),
        // InkWell(
        //   onTap: onTapLikes,
        //   child: Column(children: [
        //     Text(
        //       totalLikes,
        //       style: Theme.of(context)
        //           .textTheme
        //           .bodyText1
        //           ?.copyWith(fontSize: 14.0, fontWeight: FontWeight.bold),
        //     ),
        //     Text(
        //       "Likes",
        //       style: Theme.of(context)
        //           .textTheme
        //           .bodyText2
        //           ?.copyWith(fontSize: 12.0),
        //     )
        //   ]),
        // ),
        // const Spacer(
        //   flex: 2,
        // ),
      ],
    );
  }

  Widget cartButton({required BuildContext context, required int cartSize}) {
    return IconButton(
      onPressed: () {
        Get.to(() => cart(), transition: Transition.rightToLeft);
      },
      splashColor: Theme.of(context).primaryColor,
      splashRadius: 20.0,
      icon: Badge(
        badgeContent: Text(cartSize.toString(),style:const TextStyle(color:Colors.white,fontSize: 14),),
        child: Icon(
          Icons.shopping_basket_outlined,
          color: Theme.of(context).textTheme.bodyText1?.color,
          size: 24.0,
        ),
      ),
    );
  }

  Widget wheelButton({required BuildContext context}) {
    return IconButton(
        onPressed: () {
          Get.to(() => spinWheel(), transition: Transition.rightToLeft);
        },
        splashColor: Theme.of(context).primaryColor,
        splashRadius: 20.0,
        icon: ImageIcon(
          AssetImage('assets/images/spin_wheel.png'),
          color: Theme.of(context).textTheme.bodyText1?.color,
          size: 24.0,
        ));
  }

  // ignore: non_constant_identifier_names
  Widget AddSongButton({required BuildContext context}) {
    return IconButton(
      onPressed: () {
        Get.to(() => const AddSongScreen(), transition: Transition.rightToLeft);
      },
      splashColor: Theme.of(context).primaryColor,
      splashRadius: 20.0,
      icon: const Icon(Icons.file_upload_outlined),
      color: Theme.of(context).textTheme.bodyText1?.color,
      iconSize: 24,
    );
  }

  Widget addBookButton({required BuildContext context}) {
    return IconButton(
      onPressed: () {
        Get.to(() => const UploadBookScreen(),
            transition: Transition.rightToLeft);
      },
      splashColor: Theme.of(context).primaryColor,
      splashRadius: 20.0,
      icon: const Icon(Icons.file_upload_outlined),
      color: Theme.of(context).textTheme.bodyText1?.color,
      iconSize: 24,
    );
  }

  Widget addStoryButton({required BuildContext context}) {
    return IconButton(
      onPressed: () {
        Get.to(() => const AddStoryScreen(),
            transition: Transition.rightToLeft);
      },
      splashColor: Theme.of(context).primaryColor,
      splashRadius: 20.0,
      icon: const Icon(Icons.add_outlined),
      color: Colors.white,
      iconSize: 24,
    );
  }

  Widget newMessageButton({required BuildContext context}) {
    return IconButton(
        onPressed: () {
          Get.to(() => search(), transition: Transition.rightToLeft);
        },
        splashColor: Theme.of(context).primaryColor,
        splashRadius: 20.0,
        icon: const Icon(Icons.outgoing_mail));
  }

  Widget newMovieButton({required BuildContext context}) {
    return IconButton(
      onPressed: () => Get.off(() => const AddMovieScreen()),
      icon: const Icon(Icons.upload_outlined),
      splashRadius: 20.0,
      splashColor: Theme.of(context).primaryColor,
    );
  }

  Widget newEventButton({required BuildContext context}) {
    return IconButton(
      onPressed: () => Get.off(() => const AddEventScreen()),
      icon: const Icon(
        Icons.upload_outlined,
        color: Colors.black,
      ),
      splashRadius: 20.0,
      splashColor: Theme.of(context).primaryColor,
    );
  }

  Widget profileButton(
      {required BuildContext context,
      required String profileImageURL,
      required bool personalProfile}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Get.to(
              () => profile(
                  personalProfile: personalProfile,
                  profileImageURL: profileImageURL),
              transition: Transition.leftToRight);
        },
        splashColor: Theme.of(context).primaryColor,
        radius: 15.0,
        child: CircleAvatar(
          foregroundImage: NetworkImage(profileImageURL),
        ),
      ),
    );
  }
}
