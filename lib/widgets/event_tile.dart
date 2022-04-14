import 'package:flutter/material.dart';
import '../helpers/helpers.dart';
import '../models/event_model.dart';
import '../pages/event_page.dart';
import '../constants.dart';

/// Displays an event on a row
class EventTile extends StatelessWidget {
  final EventModel eventModel;

  /// The length of a side of the square box for the leading widget.
  final double leadingSize = 84;

  final double monthFontSize = 14;
  final double dayFontSize = 26;

  /// The padding around this [EventTile].
  final EdgeInsets padding;

  /// The border around this [EventTile].
  final BoxBorder border;

  EventTile(
    this.eventModel, {
    this.padding = const EdgeInsets.all(8.0),
    this.border = const Border.fromBorderSide(
        BorderSide(width: 1.6, color: Palette.udanceBlue)),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                color: Theme.of(context).colorScheme.secondary,
                height: leadingSize,
                width: leadingSize,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                    children: Helpers.getDateText(
                        dateStart: eventModel.dateStart,
                        dateEnd: eventModel.dateEnd,
                        monthFontSize: monthFontSize,
                        dayFontSize: dayFontSize),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: leadingSize,
                  decoration: BoxDecoration(border: border),
                  child: ListTile(
                    title: Text(eventModel.title),
                    subtitle: (eventModel.timeDiff != "")
                        ? Text(
                            eventModel.timeDiff,
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        : null,
                  ),
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EventPage(this.eventModel)));
          }),
    );
  }
}
