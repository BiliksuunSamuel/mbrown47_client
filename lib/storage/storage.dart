import "package:flutter_secure_storage/flutter_secure_storage.dart";



class LocalStorage{
  final storage=const FlutterSecureStorage();

  void insertItem(String key,dynamic value)async{
    await storage.write(key: key, value: value);
  }

  dynamic getItem(String key)async{
    return await storage.read(key: key);
  }
}

