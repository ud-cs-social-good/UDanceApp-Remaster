import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'list_item_model.dart';


class EventModel extends ListItemModel {
  EventModel({
    this.title = "",
    this.description = "",

    /// An alternative way to specify the [dateStart]
    /// in the format 'MM/dd/yy/h:mm a'.
    String dateStartString = "",

    /// An alternative way to specify the [dateEnd]
    /// in the format 'MM/dd/yy/h:mm a'.
    String dateEndString = "",
    this.imagePath = "",
    this.dateStart,
    this.dateEnd,
    this.address = "",
    this.addressLink = "",
    this.googleCalendarLink = "",
    this.icsLink = "",
  }) {
    if (dateStart == null && dateStartString != null)
      this.dateStart = DateFormat('MM/dd/yy/h:mm a').parse(dateStartString);
    if (dateEnd == null && dateEndString != null)
      this.dateEnd = DateFormat('MM/dd/yy/h:mm a').parse(dateStartString);
    super.title = title;
    super.description = description;
    if (dateStart != null) {
      super.date = dateStart?? DateTime.now();
    }
  }

  factory EventModel.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    var document = doc.data()!;
    var dateStartMS = document['dateStart']?.microsecondsSinceEpoch;
    var dateEndMS = document['dateEnd']?.microsecondsSinceEpoch;
    var dateStart = dateStartMS != null
        ? DateTime.fromMicrosecondsSinceEpoch(dateStartMS)
        : null;
    var dateEnd = dateEndMS != null
        ? DateTime.fromMicrosecondsSinceEpoch(dateEndMS)
        : null;

    return EventModel(
      title: document['title'] ?? "",
      address: document['address'] ?? "",
      addressLink: document['addressLink'] ?? "",
      dateStart: dateStart,
      dateEnd: dateEnd,
      description: document['description'] ?? "",
      googleCalendarLink: document['googleCalendarLink'] ?? "",
      icsLink: document['icsLink'] ?? "",
      imagePath: document['imagePath'] ?? "",
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

  /// When the event starts.
  DateTime? dateStart;

  /// When the event ends.
  DateTime? dateEnd;

  /// The address for the event.
  String address;

  /// The url for the address, e.g. a Google Maps link.
  String addressLink;

  /// The url for the Google Calendar link.
  String googleCalendarLink;

  /// The url to download the event in ICS format.
  String icsLink;

  /// The path to the image.
  String imagePath;

  /// Whether the event is upcoming.
  ///
  /// Returns false if a date is not specified (i.e. both the [dateStart] and
  /// [dateEnd] are null).
  bool get isUpcoming {
    DateTime now = DateTime.now();
    return ((dateStart?.isAfter(now) ?? false) ||
        (dateEnd?.isAfter(now) ?? false));
  }

  /// Returns the date(s) of the event.
  ///
  /// If the event spans more than 24 hours, returns the start and end dates.
  /// Otherwise, returns the date of the event.
  String get singleLineDate {
    if (dateStart == null) {
      return dateEnd == null
          ? ""
          : "to ${DateFormat('MMM').format(dateEnd!)} ${dateEnd!.day}";
    } else if (dateEnd == null) {
      return "${DateFormat('MMM').format(dateStart!)} ${dateStart!.day}";
    } else if (dateEnd!.difference(dateStart!).inMinutes <
        Duration.minutesPerDay) {
      return "${DateFormat('MMM').format(dateStart!)}"
          " ${dateStart!.day}";
    } else
      return "${DateFormat('MMM').format(dateStart!)}"
          " ${dateStart!.day}"
          " to ${DateFormat('MMM').format(dateStart!)} ${dateEnd!.day}";
  }

  /// Returns the the start time and end time of the event,
  /// e.g. '12:00 AM - 11:55 PM'.
  ///
  /// If the event is more than 24 hours, returns an empty String.
  String get timeDiff {
    if (dateStart == null) return "";
    if (dateEnd == null) return DateFormat('h:mm a').format(dateStart!);
    if (dateEnd!.difference(dateStart!).inMinutes < Duration.minutesPerDay) {
      return "${DateFormat('h:mm a').format(dateStart!)} - "
          "${DateFormat('h:mm a').format(dateEnd!)}";
    } else {
      return "";
    }
  }
}
