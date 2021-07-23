
import 'package:flutter/material.dart';
import 'package:flutter_projet_annuel/services/apiService.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'class/admin.dart';
import 'dart:convert' show json, base64, ascii;

class AdminItems extends StatelessWidget {
  final Admin admin;
  final String userToken;

  const AdminItems({
    Key key,
    this.admin,
    this.userToken
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {  },
        child: ListTile(
          title: Text(admin.email),
          subtitle: Text(
            "Date de création : " + admin.dateRegistered,
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              ApiServices.deleteAdmins(admin.id);
              Fluttertoast.showToast(
                msg: "Vous avez supprimé un admin",
                timeInSecForIosWeb: 2,
              );
            },
          ),
        ),
      ),
    );
  }
}