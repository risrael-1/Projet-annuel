// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_projet_annuel/services/apiService.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'class/annonces.dart';
import 'dart:convert' show json, base64, ascii;

import 'class/category.dart';
import 'verifCateg.dart';

class CategoryItems extends StatelessWidget {
  final Category category;
  final String userToken;

  const CategoryItems({
    Key key,
    this.category,
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
          title: Text(category.title),
          trailing: IconButton(
            icon: const Icon(
                Icons.delete,
                color: Colors.red,
            ),
            onPressed: () {
              ApiServices.deleteCategory(category.id);
              Fluttertoast.showToast(
                msg: "Vous avez supprimé une categorie",
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