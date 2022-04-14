import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class Helpers {
  /// Returns a list of [TextSpan] to show the date(s) with the month having a
  /// font size of [monthFontSize] and the day having a font size of
  /// [dayFontSize].
  ///
  /// If the [dateStart] and [dateEnd] are a day or more apart, then two dates
  /// are shown. Otherwise, only a single date is shown.
  static List<TextSpan> getDateText(
      {DateTime dateStart,
      DateTime dateEnd,
      double monthFontSize = 14,
      double dayFontSize = 26}) {
    List<TextSpan> list = [];
    if (dateStart != null) {
      list.add(TextSpan(
        text: DateFormat('MMM').format(dateStart),
        style: TextStyle(fontSize: monthFontSize),
      ));
      list.add(TextSpan(
        text: "\n" + dateStart.day.toString(),
        style: TextStyle(fontSize: dayFontSize),
      ));
      if (dateEnd != null) {
        if (dateEnd.difference(dateStart).inMinutes >= Duration.minutesPerDay) {
          list.add(TextSpan(
              text: "\nto " +
                  DateFormat('MMM').format(dateEnd) +
                  " " +
                  dateEnd.day.toString(),
              style: TextStyle(
                fontSize: monthFontSize,
              )));
        }
      }
    } else if (dateEnd != null) {
      list.add(TextSpan(
          text: "to " + DateFormat('MMM').format(dateEnd),
          style: TextStyle(fontSize: monthFontSize)));
      list.add(TextSpan(
          text: "\n" + dateEnd.day.toString(),
          style: TextStyle(fontSize: dayFontSize)));
    }
    return list;
  }

  /// Launches the [url] with the flutter url_launcher package.
  ///
  /// Displays a [SnackBar] if an exception occurs. The optional [text] should
  /// be the text containing the [url] (e.g. it would be the word 'here' in
  /// 'click here for the link', where 'here' contains the url).
  /// The optional [title] should be the title of the page or section containing
  /// the [url].
  static Future<void> launchURL(BuildContext context, String url,
      {String text, String title}) async {
    String errorMessage;
    try {
      await _launchURL(url);
    } on FormatException catch (e) {
      errorMessage = e.message;
    } catch (e) {
      errorMessage = "other exception: " + e.toString();
    } finally {
      if (errorMessage != null) {
        if (text != null) {
          errorMessage += ", for '$text'";
        }
        if (title != null) {
          errorMessage += ", event: $title";
        }
        Scaffold.of(context).showSnackBar((SnackBar(
          content: Text(Constants.invalidURLMessage),
          duration: Duration(seconds: 3),
        )));
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text(Constants.invalidURLMessage),
        //   duration: Duration(seconds: 3),
        // ));

        print("error: " + errorMessage);
        //TODO add notification in database for invalid url.
      }
    }
  }

  static Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw FormatException("Invalid url '$url'");
    }
  }
}
