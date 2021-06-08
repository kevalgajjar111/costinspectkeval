import 'package:flutter/cupertino.dart';

class FiltertitleModel {
  String title;
  String position;
  bool selected;

  FiltertitleModel({this.title, this.position, this.selected });

  FiltertitleModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    position = json['position'];
    selected = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['position'] = this.position;
    data['selected'] = this.selected;
    return data;
  }
}
