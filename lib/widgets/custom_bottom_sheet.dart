import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/models.dart';
import '../helpers/helpers.dart';

/// Renders the [items] to show in the bottom sheet.
///
/// Each [RowButtonModel] is displayed as a [ListTile]. If both the
/// [RowButtonModel.url] and [RowButtonModel.shouldCopy] properties of the
/// [RowButtonModel] are null, then a [SizedBox.shrink()] is displayed instead
/// for the [RowButtonModel].
class CustomBottomSheet extends StatelessWidget {
  final ListItemModel listItemModel;

  final List<RowButtonModel> items;

  CustomBottomSheet(this.listItemModel, this.items);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: items.map((item) {
          if (item.url != null || item.shouldCopy) {
            return ListTile(
              title: Text(item.text),
              onTap: () async {
                Navigator.of(context).pop();
                if (item.shouldCopy) {
                  Clipboard.setData(ClipboardData(text: listItemModel.address));
                } else {
                  Helpers.launchURL(
                    context,
                    item.url,
                    text: item.text,
                    title: item.eventTitle,
                  );
                }
              },
            );
          } else
            return SizedBox.shrink();
        }).toList(),
      ),
    );
  }
}
