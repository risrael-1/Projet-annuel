import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


class CategoryJSON {

  final String error;
  final List<Category> categories;

  CategoryJSON(this.error, this.categories);

  factory CategoryJSON.fromJson(Map<String, dynamic> json) {
    var list = json['response'] as List;
    List<Category> categoriesList = list.map((i) => Category.fromJson(i)).toList();

    return CategoryJSON(
        json["error"],
        categoriesList
    );
  }
}


class Category {

  static String _id = '';
  String id = _id;
  final String title;

  Category(this.id,this.title);


  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        json["_id"],
        json["title"]
    );
  }
}
