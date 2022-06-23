class Routes {
  static const String appBaseUrl = "http://192.168.43.230:2031/";
  //get routes
  static const String postsGet = "api/posts/get";
  static const String songsGet = "api/songs/get";
  static const String moviesGet = "api/movies/get";
  static const String booksGet = "api/books/get";
  static const String userLogin = "api/login";
  static const String userRegister = "api/register";
  static const String usersGet = "api/users/get";
  static const String storiesGet = "api/stories/get";
  static const String eventsGet = "api/events/get";
  //add routes
  static const String songUpload = "api/songs/add";
  static const String booksAdd = "api/books/add";
  static const String storyAdd = "api/story/add";
  static const String movieUpload = "api/movie/upload";
  static const String eventAdd = "api/event/add";

  //delete routes
  static const String deleteEvent = "api/event/delete";
  static const String deleteBook = "api/book/delete";
  //update routes
  static const String eventUpdate = "api/event/update";
  static const String storyUpdate = "api/story/update";
  static const String updateUserInfo = "api/user/update";
  static const String updateBookInfo = "api/book/update";
  static const String updateSongInfo = "api/song/update";
  static const String phoneVerify = "api/phone/verify";
  static const String changePassword = "api/password/change";
  static const String storyReply = "api/story/reply";
  static const String storyCommentUpdate = "api/story/comment/update";
}
