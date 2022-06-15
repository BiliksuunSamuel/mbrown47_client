import 'dart:convert';

import 'package:glory/data/data.dart';
import 'package:glory/models/book_model.dart';
import 'package:glory/models/event_model.dart';
import 'package:glory/models/movie_model.dart';
import 'package:glory/models/song_model.dart';
import 'package:glory/models/user_model.dart';

String base64Encode(List<int> bytes) {
  String baseData = base64.encode(bytes);
  return baseData;
}

int calculateFollowers(List<dynamic> followers) {
  int total = 0;
  for (int i = 0; i < followers.length; i++) {
    total = total + 1;
  }
  return total;
}

int getFollowing(List<dynamic> accounts, dynamic userId) {
  int total = 0;
  for (int i = 0; i < accounts.length; i++) {
    dynamic account = accounts[i];
    List<dynamic> followers = account["followers"];
    if (followers.contains(userId)) {
      total = total + 1;
    }
  }

  return total;
}

int calculateLikes(List<dynamic> likes) {
  int total = 0;
  for (int i = 0; i < likes.length; i++) {
    total = total + 1;
  }
  return total;
}

int calculateTotalComments(List<dynamic> comments) {
  int total = 0;
  for (int i = 0; i < comments.length; i++) {
    total = total + 1;
  }
  return total;
}

String getProfileImage(UserModel user) {
  String? userImage = user.profileImage;
  if (userImage.isNotEmpty) {
    return userImage;
  } else {
    return "assets/sample_image.png";
  }
}

List<dynamic> formatDropdownInputData(List<dynamic> content) {
  List<dynamic> data = [];

  for (int i = 0; i < content.length; i++) {
    data.add({"value": content[i], "display": content[i]});
  }
  return data;
}

List<SongModel> formatSongsInfo(List<dynamic> data) {
  List<SongModel> songs = [];
  for (int i = 0; i < data.length; i++) {
    SongModel song = SongModel.fromJson(data[i]);
    songs.add(song);
  }
  return songs;
}

List<MovieModel> formatMoviesInfo(List<dynamic> data) {
  List<MovieModel> movies = [];
  for (dynamic movie in data) {
    movies.add(MovieModel.fromJson(movie));
  }
  return movies;
}

UserModel getUser(List<UserModel> users, dynamic id) {
  int index = users.indexWhere((u) => u.id == id);
  if (index != -1) {
    return users[index];
  } else {
    return UserModel.fromJson(Data.initialUserInfo);
  }
}

List<BookModel> getCartBooks(List<String> cartItems, List<BookModel> books) {
  List<BookModel> cart = [];
  for (String bookId in cartItems) {
    int index = books.indexWhere((element) => element.id == bookId);
    if (index != -1) {
      cart.add(books[index]);
    }
  }
  return cart;
}

List<EventModel> getCartEvents(
    List<String> cartEvents, List<EventModel> events) {
  List<EventModel> cart = [];
  for (String eventId in cartEvents) {
    int index = events.indexWhere((element) => element.id == eventId);
    if (index != -1) {
      cart.add(events[index]);
    }
  }
  return cart;
}

double getCartCost(List<BookModel> cartItems) {
  double cost = 0;
  for (BookModel item in cartItems) {
    cost = cost + item.cost;
  }
  return cost;
}
