import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  // This is to save your favorite wall. to your local device
  toggleFav(String url) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final myFavList = prefs.getStringList("favoriteList");
    if (myFavList != null) {
      if (myFavList.contains(url)) {
        myFavList.remove(url);
        await prefs.setStringList("favoriteList", myFavList);
      } else {
        myFavList.add(url);
        await prefs.setStringList("favoriteList", myFavList);
      }
    } else {
      await prefs.setStringList("favoriteList", [url]);
    }
  }

}