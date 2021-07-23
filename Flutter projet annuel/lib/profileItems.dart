
import 'package:flutter/material.dart';
import 'package:flutter_projet_annuel/services/apiService.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert' show json, base64, ascii;

import 'class/profil.dart';

class ProfilItems extends StatelessWidget {
  final Profil profil;
  final String userToken;

  const ProfilItems({
    Key key,
    this.profil,
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
          title: Text(profil.username + " " + profil.city ),
          subtitle: Text(
            "Créé le " + profil.createdAt + "\n"
            + "Numéro de téléphone : " + profil.telNumber + "\n"
            + "Ville : " + profil.city,
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              print(profil.id);
              ApiServices.deleteProfil(profil.id);
              Fluttertoast.showToast(
                msg: "Vous avez supprimé un profil",
                timeInSecForIosWeb: 2,
              );
            },
          ),

        ),

        onPressed: () {  },
      ),
    );
  }
}