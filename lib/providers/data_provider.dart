import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:my_contacts/models/user.dart';
import '../utils/constant.dart';

class DataProvider with ChangeNotifier{

  List<User> _user = [];
  List<User> get user {
    return [..._user];
  }


  Future<dynamic> fetchAndSetUsers() async {
    const url = '$API_ENDPOINT/?results=50';
      
      final response = await http.get(Uri.parse(url));
      if(response.body == null)  {
        return null;
      }

      debugPrint('get:' + '${response.statusCode}');
      final extractedData = json.decode(response.body);

      List results = extractedData["results"];
      // debugPrint("============== Data fetched");
      final List<User> loadedUser = [];
      for (var i = 0; i < results.length; i++) {
        var userItem = User.fromJson(results[i]); 
        loadedUser.add(userItem);
      }

      _user = loadedUser;
      notifyListeners();

      return _user;

  }

  Future<String> addPost(String title, String body) async {
    const url = '$API_ENDPOINT/posts';

    try {
      final response = await http.post(
        Uri.parse(url),
         headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
          "title": title,
          "body": body,
          "userId": 1
        })
      );

      if (response.statusCode == 201) {
        return "success";
      } else {
        return "error";
      }
      
    } catch (e) {
      rethrow;
    }
  }

  User postById(int id) {
    return _user.firstWhere((post) => post.id == id);
  }

  int totalContacts() => _user.length;

}