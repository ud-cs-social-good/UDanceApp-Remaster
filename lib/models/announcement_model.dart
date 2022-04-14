import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'list_item_model.dart';

class AnnouncementModel extends ListItemModel {
  AnnouncementModel({
    this.title = "",
    this.description = "",
    this.imagePath,
    this.location,
  }){
    super.title = title;
    super.description = description;
  }


  factory AnnouncementModel.fromDocument(DocumentSnapshot doc) {
    var document = doc.data();

    return AnnouncementModel(
      title: document['title'] ?? "",
      location: document['location'] ?? "",
      description: document['text'] ?? "",
      imagePath: document['flag'] ?? "",
    );
  }

  /// The title for the event.
  ///
  /// Defaults to an empty string if not specified.
  String title;

  /// The description of the event.
  ///
  /// Defaults to an empty string if not specified.
  String description;

   /// The path to the image.
  String imagePath;

  //Location of event (if applicable)
String location;
}
