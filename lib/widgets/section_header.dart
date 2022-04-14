import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key? key,
    required this.text,
    this.padding = const EdgeInsets.only(bottom: 8)
  }) : super(key: key);

  /// The text to display.
  final String text;

  /// Padding around the text.
  ///
  /// Defaults to EdgeInsets.symmetric(vertical: 8.0).
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline5!.copyWith(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
