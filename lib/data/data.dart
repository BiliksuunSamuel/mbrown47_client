class Data {
  static const List<String> moviesCategories = [
    "Trending",
    "New Release",
    "Action",
    "Comedy",
    "Drama",
    "Fantasy",
    "Horror",
    "Mystery",
    "Romance",
    "Thriller",
    "Western"
  ];

  // late String fullname;
  // late String username;
  // late String email;
  // late String phone;
  // late String status;
  // late List<String> followers ;
  // late String profileImage;
  // late String dateCreated;
  // late String authId ;
  // late String id;
  // late int role;

  static const Map<String, dynamic> initialUserInfo = {
    "username": "",
    "_id": "",
    "phone": "",
    "status": "",
    "fullname": "Glory-Guest",
    "email": "",
    "role": 0,
    "authId": "",
    "dateCreated": "",
    "profileImage": "",
    "followers": [],
  };

  static const List<Map<String, dynamic>> bookIndex = [
    {"display": "Popular", "value": "1"},
    {"display": "Regular", "value": "0"},
  ];

  static const List<Map<String, dynamic>> bookPricing = [
    {"display": "Paid", "value": "1"},
    {"display": "Free", "value": "0"},
  ];

  static const List<Map<String, dynamic>> storyContentType = [
    {"display": "Video", "value": "video"},
    {"display": "Photo", "value": "photo"},
    {"display": "Text", "value": "text"},
  ];
}
