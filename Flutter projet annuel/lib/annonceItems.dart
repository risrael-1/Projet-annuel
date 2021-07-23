

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'class/annonces.dart';
import 'dart:convert' show json, base64, ascii;

import 'services/apiService.dart';

class AnnonceItems extends StatelessWidget {
  final Annonce annonce;
  final String userToken;

  const AnnonceItems({
    Key key,
    this.annonce,
    this.userToken
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 600,
      child: RaisedButton(
        color: Colors.white,
        child: ListTile(
          title: Text(annonce.title),
          subtitle: Text(
            "Type d'annonce : " + annonce.type + "\n"
            + "Description : " + annonce.description + "\n"
            + "Utilisateur : " + annonce.username,
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              ApiServices.deleteAnnonces(annonce.id);
              Fluttertoast.showToast(
                msg: "Vous avez supprimé une annonce",
                timeInSecForIosWeb: 2,
              );
            },
          ),
        ),
        onPressed: () {
        },
      ),
    );
  }
}