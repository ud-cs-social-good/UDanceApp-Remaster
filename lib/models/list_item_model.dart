import 'package:intl/intl.dart';

class ListItemModel {
  ListItemModel({this.title = "", this.description = "", this.date, this.addressLink ="", this.address = ""});

  String title;
  String description;
  DateTime? date;
  String address;
  String addressLink;

  /// Returns a three-letter String abbreviation for the month.
  String get monthAbbrev {
    return date != null ? DateFormat('MMM').format(date) : "";
  }
}
