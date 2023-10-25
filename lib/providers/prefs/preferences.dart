import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider extends ChangeNotifier{
  late SharedPreferences prefs;

  init() async {
    prefs=await SharedPreferences.getInstance();
  }

  setToken(String token) async {
    await prefs.setString("token", token);
  }

  String? getToken()  {
    return prefs.getString("token");
  }

  Future<bool> clearToken() {
    return prefs.clear();
  }

  setName(String name) async {
    await prefs.setString("name", name);
  }

  String? getName() {
    return prefs.getString("name");
  }

  setPostedCategory(String category) async {
    await prefs.setString("postedCategory", category);
    notifyListeners();
  }

  String? getPostedCategory(){
    return prefs.getString("postedCategory");
  }
}