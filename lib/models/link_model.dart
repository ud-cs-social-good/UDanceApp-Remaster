import 'package:cloud_firestore/cloud_firestore.dart';

class LinkModel {
  LinkModel({this.title = "", this.description = "", this.url, this.photo = ""});

  String title;
  String description;
  String url;
  String photo;

  factory LinkModel.fromDocument(DocumentSnapshot doc) {
    var document = doc.data();

    return LinkModel(
      title: document['title'] ?? "",
      description: document['description'] ?? "",
      photo: document['photo'] ?? "",
      url: document['url'] ?? ""
    );
  }

}