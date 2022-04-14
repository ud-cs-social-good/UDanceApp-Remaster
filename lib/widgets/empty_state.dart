import 'package:flutter/material.dart';

/// Widget displaying an icon and text representing an empty state.
class EmptyState extends StatelessWidget {
  const EmptyState({
    Key? key,
    this.height = 140,
    this.icon = const Icon(Icons.calendar_today),
    this.text = const Text("Check back later for more!")
  }) : super(key: key);

  /// The height of this EmptyState widget.
  final double height;

  /// The icon to show above the text.
  final Widget icon;

  /// The text to show below the icon.
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          text
        ],
      ),
    );
  }
}
