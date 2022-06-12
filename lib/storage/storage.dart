import 'package:localstorage/localstorage.dart';

void handleAddItemToStorage(dynamic userInfo,dynamic key)  {
  LocalStorage storage = LocalStorage(key);
     storage.setItem(key, userInfo);
  
}

dynamic getStorageItem(dynamic key)  {
  LocalStorage storage = LocalStorage(key);
    return  storage.getItem(key);

}
