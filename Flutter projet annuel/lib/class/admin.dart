import 'package:flutter/cupertino.dart';


class AdminJSON {

  final List<Admin> admins;

  AdminJSON(this.admins);

  factory AdminJSON.fromJson(Map<String, dynamic> json) {
    var list = json['response'] as List;
    List<Admin> adminsList = list.map((i) => Admin.fromJson(i)).toList();

    return AdminJSON(
        adminsList
    );
  }
}


class Admin {

  static String _id = '';
  String id = _id;
  final String email;
  final String dateRegistered;

  Admin(this.id,this.email, this.dateRegistered);


  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
        json["_id"],
        json["email"],
        json["dateRegistered"]
    );
  }
}
