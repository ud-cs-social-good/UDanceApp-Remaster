import 'package:flutter/material.dart';
import 'package:udance/constants.dart';
import '../models/models.dart';
import '../pages/event_page.dart';
import 'empty_state.dart';
import 'event_tile.dart';

/// Displays a number of [items] specified by [numItems].
///
/// If [items] is empty, displays an [EmptyState].
class ListSection extends StatelessWidget {
  const ListSection({
    Key key,
    @required this.items,
    this.maxLines,
    this.numItems = 2,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  /// The list of items.
  final List<ListItemModel> items;

  /// The maximum lines for each item.
  final int maxLines;

  /// The number of items to show.
  ///
  /// Defaults to 2.
  final int numItems;

  /// The padding around this entire [ListSection].
  ///
  /// Defaults to EdgeInsets.all(0).
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return items.length != 0
        ? Padding(
            padding: padding,
            child: Column(
              children: _getItems(context),
            ),
          )
        : Center(child: EmptyState());
  }

  List _getItems(BuildContext context) {
    int itemsToShow = numItems;

    if (numItems > items.length) {
      itemsToShow = items.length;
    }

    return items
        .sublist(0, itemsToShow)
        .map(
          (e) => e is EventModel
              ? EventTile(
                  e,
                  padding: EdgeInsets.only(bottom: 8),
                  // border: Border(
                  //     top: BorderSide(color: Palette.udanceBlue, width: 1.6)),
                )
              : Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.all(8),
                    title: e.title != null
                        ? Text(
                            (e.date != null)
                                ? "(${e.date.month}/${e.date.day}) ${e.title}"
                                : e.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        : null,
                    subtitle: e.description != null
                        ? Text(
                            e.description,
                            maxLines: maxLines,
                            overflow: maxLines != null
                                ? TextOverflow.ellipsis
                                : null,
                          )
                        : null,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EventPage(e)));
                    },
                  ),
                ],
              ),
        )
        .toList();
  }
}
