import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';
import '../constants.dart';
import '../helpers/helpers.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

/// Page displaying an event.
class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage(this.announcementModel, {this.expandedFraction = 0.4});


  /// The event to display.
  final AnnouncementModel announcementModel;

  /// The fraction of the screen height the event image should take.
  ///
  /// For example, for 0.4, the image will take up 40% of the screen height.
  /// Defaults to 0.4.
  final double expandedFraction;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    double expandedFraction = this.expandedFraction;
    if (expandedFraction < 0) expandedFraction = 0;
    final double expandedHeight = deviceHeight * expandedFraction;

    const double titlePadding = 16;
    final double titleWidth = deviceWidth - titlePadding * 2;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                      width: deviceWidth,
                      height: expandedHeight,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                              BorderSide(color: Colors.grey, width: 0))),
                      child: TopImage(imagePath: announcementModel.imagePath)),
                  Container(
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.only(
                          top: titlePadding, bottom: titlePadding),
                      // height: textHeight,
                      width: titleWidth,
                      child: AutoSizeText(
                        announcementModel.title.toUpperCase(),
                        style: Theme.of(context).textTheme.headline3.copyWith(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.4,
                          color: Theme.of(context).accentColor,
                        ),
                        maxLines: 2,
                      )),
                  _EventDescription(
                    title: announcementModel.title,
                    description: announcementModel.description,
                  ),
                  if (announcementModel.address != "") ...[
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.pin_drop),
                      title: Text(announcementModel.address,
                          style: Theme.of(context).textTheme.bodyText2),
                        onTap: () {
                            showModalBottomSheet(
                            context: context,
                            builder: (context) =>
                            CustomBottomSheet(announcementModel, [
                            RowButtonModel(
                            text: Constants.openInGoogleMaps,
                            url: announcementModel.addressLink,
                            eventTitle: announcementModel.title),
                            RowButtonModel(
                            text: Constants.copy, shouldCopy: true),
                            ]));
                            },
                    ),
                    Divider(),
                  ]
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.4)),
                    child: IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopImage extends StatelessWidget {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  TopImage({
    Key key,
    this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: storage.ref(imagePath).getDownloadURL(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Image.network(snapshot.data, fit: BoxFit.cover);
          } else {
            return Image.asset(Constants.imgDefaultEvent);
          }
        }
    );
  }
}

/// Displays the description of the event with the [flutter_markdown] package.
class _EventDescription extends StatelessWidget {
  const _EventDescription({
    Key key,
    this.description = "",
    this.title,
  }) : super(key: key);

  final String description;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: MarkdownBody(
        data: description,
        selectable: true,
        onTapLink: (text, url, title) {
          Helpers.launchURL(
            context,
            url,
            text: text,
            title: title,
          );
        },
      ),
    );
  }
}
