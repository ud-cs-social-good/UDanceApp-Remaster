import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/models.dart';
import 'custom_bottom_sheet.dart';
import '../helpers/helpers.dart';

class ExpandableEventTile extends StatelessWidget {
  final EventModel eventModel;

  /// The length of a side of the leading placeholder square box.
  final double leadingSize = 74;

  /// The length of a side of the overlay box for the leading widget.
  final double leadingOverlaySize = 86;

  ExpandableEventTile(this.eventModel);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).accentColor,
              width: 1.4,
            ),
          ),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.only(right: 16.0),
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SizedBox(
                    width: leadingSize,
                    height: leadingSize,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(eventModel.title),
                        eventModel.timeDiff != ""
                            ? Text(
                          eventModel.timeDiff,
                          style: Theme.of(context).textTheme.bodyText1,
                        )
                            : const SizedBox.shrink()
                      ],
                    ),
                  ),
                ),
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text(eventModel.description),
              ),
              if (eventModel.address != null) ...[
                Divider(),
                ListTile(
                  leading: Icon(Icons.pin_drop),
                  title: Text(eventModel.address,
                      style: Theme.of(context).textTheme.bodyText2),
                  onTap: () {
                    // _launchURL(event.addressLink);
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => CustomBottomSheet(eventModel, [
                          RowButtonModel(
                              text: Constants.openInGoogleMaps,
                              url: eventModel.addressLink,
                              eventTitle: eventModel.title),
                          RowButtonModel(
                              text: Constants.copy, shouldCopy: true),
                        ]));
                  },
                  // onLongPress: () {
                  //   Clipboard.setData(ClipboardData(text: event.address));
                  //   //TODO: Android has small popup showing text was copied; check if iOS does
                  //   // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //   //   content: const Text('Copied!'),
                  //   //   duration: const Duration(seconds: 1),
                  //   // ));
                  // },
                ),
                Divider(),
              ],
              ButtonBar(
                children: [
                  if (eventModel.googleCalendarLink != null ||
                      eventModel.icsLink != null)
                    TextButton(
                      child: Text(Constants.addToCalendar),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => CustomBottomSheet(eventModel, [
                              RowButtonModel(
                                  text: Constants.addToGoogleCalendar,
                                  url: eventModel.googleCalendarLink,
                                  eventTitle: eventModel.title),
                              RowButtonModel(
                                  text: Constants.ics,
                                  url: eventModel.icsLink,
                                  eventTitle: eventModel.title),
                            ]));
                      },
                    )
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 4,
          left: 4,
          child: Container(
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.center,
            width: leadingOverlaySize,
            height: leadingOverlaySize,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
                  children: Helpers.getDateText(
                    dateStart: eventModel.dateStart,
                    dateEnd: eventModel.dateEnd
                  )),
            ),
          ),
        )
      ],
    );
  }
}
