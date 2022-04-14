import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../helpers/helpers.dart';
import '../models/link_model.dart';
import '../pages/event_page.dart';
import '../constants.dart';

import 'package:url_launcher/url_launcher.dart';

/// Displays an event on a row
class LinkTile extends StatelessWidget {
  final LinkModel linkModel;

  /// The length of a side of the square box for the leading widget.
  final double leadingSize = 84;

  final double monthFontSize = 14;
  final double dayFontSize = 26;

  /// The padding around this [EventTile].
  final EdgeInsets padding;

  /// The border around this [EventTile].
  final BoxBorder border;

  LinkTile(
    this.linkModel, {
    this.padding = const EdgeInsets.all(8.0),
    this.border = const Border.fromBorderSide(
        BorderSide(width: 1.6, color: Palette.udanceBlue)),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        //padding: EdgeInsets.fromLTRB(0, 5, 0, 3),
        child: Column(children: [
      new Container(
          child: Center(
              child: Image.network(linkModel.photo,
                  width: MediaQuery.of(context).size.width * .8))),
      new Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Center(
              child: new RichText(
                  textAlign: TextAlign.center,
                  text: new TextSpan(children: [
                    new TextSpan(
                        text: linkModel.title,
                        style: new TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            launch(linkModel.url);
                          })
                  ])))),
      new Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Center(
              child: Text(linkModel.description)))
    ]));
  }
}
