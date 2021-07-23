import 'dart:convert';
import 'dart:io';

import 'package:flutter_projet_annuel/class/newUsers.dart';
import 'package:flutter_projet_annuel/class/user.dart';

import '../class/admin.dart';
import '../class/annonces.dart';
import '../class/category.dart';
import '../class/profil.dart';
import 'package:http/http.dart' as http;

var JWT = "" ;


class ApiServices {
  static Future<List<Annonce>> getAnnonces() async {
    final response =
    //  await http.get("https://next.json-generator.com/api/json/get/VJX9FVx1F");

    //  await http.get("https://webhook.site/93e4dd43-1476-4b9e-b94a-5660681be525");
//    await http.get("http://localhost:3000/annonces/all");
    await http.get(
      Uri.parse('https://benevold.herokuapp.com/flutter/annonces'),
      headers: <String, String>{
        'Content-Type': 'application/json', 'access-token' : JWT
      },
    );

    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);

    AnnonceJSON annonceJSON = AnnonceJSON.fromJson(jsonBody);
    print(annonceJSON);
    print(jsonBody);
    return annonceJSON.annonces;
  }

  static Future<int> getNewUsers() async {
    final response =
    //  await http.get("https://next.json-generator.com/api/json/get/VJX9FVx1F");

    //  await http.get("https://webhook.site/93e4dd43-1476-4b9e-b94a-5660681be525");
//    await http.get("http://localhost:3000/annonces/all");
    await http.get(
      Uri.parse('https://benevold.herokuapp.com/flutter/count/all/users'),
      headers: <String, String>{
        'Content-Type': 'application/json', 'access-token' : JWT
      },
    );
    print(response.body);
    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);

    NewUsers newUser = NewUsers.fromJson(jsonBody);
    print(newUser.response);
    return newUser.response;
  }

 static Future<List<Admin>> getAdmin() async {
    final response =
    //  await http.get("https://next.json-generator.com/api/json/get/VJX9FVx1F");

    //  await http.get("https://webhook.site/93e4dd43-1476-4b9e-b94a-5660681be525");
//    await http.get("http://localhost:3000/annonces/all");
    await http.get(
      Uri.parse('https://benevold.herokuapp.com/flutter/users'),
      headers: <String, String>{
        'Content-Type': 'application/json', 'access-token' : JWT
      },
    );

    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);

    AdminJSON adminJSON = AdminJSON.fromJson(jsonBody);
    return adminJSON.admins;
  }

  static Future<List<Profil>> getProfil() async {
    final response =
    //  await http.get("https://next.json-generator.com/api/json/get/VJX9FVx1F");

    //  await http.get("https://webhook.site/93e4dd43-1476-4b9e-b94a-5660681be525");
//    await http.get("http://localhost:3000/annonces/all");
    await http.get(
      Uri.parse('https://benevold.herokuapp.com/flutter/profiles'),
      headers: <String, String>{
        'Content-Type': 'application/json', 'access-token' : JWT
      },
    );


    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);

    ProfilJSON profilJSON = ProfilJSON.fromJson(jsonBody);
    return profilJSON.profiles;
  }

  static Future<List<Category>> getCategory() async {
    final response =
    //  await http.get("https://next.json-generator.com/api/json/get/VJX9FVx1F");

    //  await http.get("https://webhook.site/93e4dd43-1476-4b9e-b94a-5660681be525");
//    await http.get("http://localhost:3000/annonces/all");
    await http.get(
      Uri.parse('https://benevold.herokuapp.com/flutter/categories'),
      headers: <String, String>{
        'Content-Type': 'application/json', 'access-token' : JWT
      },
    );


    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);

    CategoryJSON categoryJSON = CategoryJSON.fromJson(jsonBody);
    return categoryJSON.categories;
  }

  // signIn
  static bool loginsuccess = false;

  static Future<void> login(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('https://benevold.herokuapp.com/flutter/signin/admin'),
      headers: <String, String>{
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        "email": email,
        "password": password
      })
    );

    if (response.statusCode != 200) {
      throw Error();
    }

    final jsonBody = json.decode(response.body);
    final User token = User.fromJson(jsonBody);
    final User error = User.fromJson(jsonBody);

    loginsuccess = true;
    JWT = token.token;
  }

  static Future<void> createCategory(
      String title) async {
    final response = await http.post(
      Uri.parse('https://benevold.herokuapp.com/flutter/category'),
      // 'https://webhook.site/39c3d9a5-a5e1-451c-8bb0-8fe3775f89a1',
      headers: <String, String>{
        'Content-Type': 'application/json', 'access-token' : JWT
      },
      body: jsonEncode(
          <String, dynamic>{'title': title}),
    );

    if (response.statusCode != 200) {
      throw Error();
    }
  }

  static Future<void> createAdmin(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('https://benevold.herokuapp.com/flutter/add/admin'),
      // 'https://webhook.site/39c3d9a5-a5e1-451c-8bb0-8fe3775f89a1',
      headers: <String, String>{
        'Content-Type': 'application/json', 'access-token' : JWT
      },
      body: jsonEncode(
          <String, dynamic>{'email': email, 'password': password}),
    );

    if (response.statusCode != 200) {
      throw Error();
    }
  }

  static Future<void> deleteCategory(String category_id) async {
    final response = await http.delete(
      //'https://findandtrade.herokuapp.com/annonces',
      Uri.parse('https://benevold.herokuapp.com/flutter/category'),
      headers: <String, String>{
        'Content-Type': 'application/json', 'access-token' : JWT,
      },
      body: jsonEncode(
          <String, dynamic>{'category_id': category_id}),
    );
    print(response.body);

    if (response.statusCode != 200) {
      throw Error();
    }
  }

  static Future<void> deleteAnnonces(String annonce_id) async {
    final response = await http.delete(
      //'https://findandtrade.herokuapp.com/annonces',
      Uri.parse('https://benevold.herokuapp.com/flutter/annonce'),
      headers: <String, String>{
        'Content-Type': 'application/json', 'access-token' : JWT,
      },
      body: jsonEncode(
          <String, dynamic>{'annonce_id': annonce_id}),
    );
    print(response.body);

    if (response.statusCode != 200) {
      throw Error();
    }
  }

  static Future<void> deleteAdmins(String id) async {
    final response = await http.delete(
      //'https://findandtrade.herokuapp.com/annonces',
      Uri.parse('https://benevold.herokuapp.com/flutter/admin'),
      headers: <String, String>{
        'Content-Type': 'application/json', 'access-token' : JWT,
      },
      body: jsonEncode(
          <String, dynamic>{'id': id}),
    );
    print(response.body);

    if (response.statusCode != 200) {
      throw Error();
    }
  }

  static Future<void> deleteProfil(String id) async {
    final response = await http.delete(
      //'https://findandtrade.herokuapp.com/annonces',
      Uri.parse('https://benevold.herokuapp.com/flutter/profile'),
      headers: <String, String>{
        'Content-Type': 'application/json', 'access-token' : JWT,
      },
      body: jsonEncode(
          <String, dynamic>{'profile_id': id}),
    );

    if (response.statusCode != 200) {
      throw Error();
    }
  }
}