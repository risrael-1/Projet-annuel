import 'package:flutter/cupertino.dart';


class ProfilJSON {

  final String error;
  final List<Profil> profiles;

  ProfilJSON(this.error, this.profiles);

  factory ProfilJSON.fromJson(Map<String, dynamic> json) {
    var list = json['response'] as List;
    List<Profil> profilesList = list.map((i) => Profil.fromJson(i)).toList();

    return ProfilJSON(
        json["error"],
        profilesList
    );
  }
}


class Profil {

  static String _id = '';
  String id = _id;
  final String username;
  final String mail;
  final String telNumber;
  final String adress;
  final String postalCode;
  final String city;
  final String createdAt;
  final String type;

  Profil(this.id,this.username, this.mail, this.telNumber, this.adress, this.postalCode, this.city, this.createdAt, this.type);


  factory Profil.fromJson(Map<String, dynamic> json) {
    return Profil(
        json["_id"],
        json["username"],
        json["mail"],
        json["telNumber"],
        json["adress"],
        json["postalCode"],
        json["city"],
        json["createdAt"],
        json["type"]
    );
  }
}
