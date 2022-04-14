/// A model for a clickable list tile.
class RowButtonModel {
  RowButtonModel(
      {this.text = "", this.url, this.shouldCopy = false, this.eventTitle});

  /// The button text to display.
  ///
  /// Defaults to empty string "".
  String text;

  /// The url to launch.
  String url;

  /// Whether the text should be copied.
  bool shouldCopy;

  /// The source text to display for invalid url.
  String eventTitle;
}
