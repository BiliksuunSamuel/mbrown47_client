import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glory/Utils/cWidgets.dart';
import 'package:glory/Utils/utils.dart';
import 'package:glory/components/artist_group_songs.dart';
import 'package:glory/components/list_title_label.dart';
import 'package:glory/components/music_abulm_group.dart';
import 'package:glory/components/new_songs_display.dart';
import 'package:glory/components/popular_playlist.dart';
import 'package:glory/components/songs_carousel.dart';
import 'package:glory/components/top_songs_display.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/screens/subScreens/musicPlayer.dart';
import 'package:glory/screens/subScreens/search.dart';
import 'package:glory/services/controllers/songs_controller.dart';
import 'package:glory/services/controllers/user_controller.dart';

class music extends StatelessWidget {
  final List<String> _dummyAlbum = [
    "https://images.pexels.com/photos/853151/pexels-photo-853151.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.unsplash.com/photo-1493612276216-ee3925520721?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=464&q=80",
    "https://images.unsplash.com/photo-1545987796-200677ee1011?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmV0d29ya3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80),"
        "https://images.unsplash.com/photo-1545987796-200677ee1011?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmV0d29ya3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
  ];

  final cWidgets _widgets = cWidgets();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      return GetBuilder<SongsController>(builder: (songsController) {
        songsController.getSongs();
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
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
                      "Music",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ))),
            centerTitle: true,
            titleTextStyle:
                Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18.0),
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: _widgets.profileButton(
                context: context,
                profileImageURL: Routes.appBaseUrl + getProfileImage(userController.user),
                personalProfile: true),
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
              _widgets.AddSongButton(context: context),
              _widgets.wheelButton(context: context),
              _widgets.cartButton(context: context, cartSize: 0),
            ],
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              SongsCarousel(songs: songsController.songs),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              const ListTitleLabel(text: "Popular Playlist"),
              PopularPlaylist(songs: songsController.songs),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
             const  ListTitleLabel(text: "Top Songs"),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              TopSongsDisplay(songs: songsController.songs),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              const ListTitleLabel(text: "Abulm"),
              MusicAbulmGroup(songs: songsController.songs),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              const  ListTitleLabel(text: "Artist"),
              ArtistGroupSongs(songs: songsController.songs),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
            //  const  ListTitleLabel(text: "What's New"),
              // NewSongsDisplay(songs: songsController.songs),
              const Padding(padding: EdgeInsets.only(top: 30.0)),
            ],
          ),
        );
      });
    });
  }
}
