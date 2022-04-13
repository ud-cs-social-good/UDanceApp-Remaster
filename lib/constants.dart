import 'dart:ui';

class Constants {
  // event page
  static const String openInGoogleMaps = "Open in Google Maps";
  static const String copy = "Copy";
  static const String addToCalendar = "Add to Calendar";
  static const String addToGoogleCalendar = "Add to Google Calendar";
  static const String ics = "ICS";
  static const String invalidURLMessage =
      "Invalid URL. UDance team has been notified.";

  /// Path to the video to be played on the landing page.
  static const String videoPath = "assets/video.mp4";

  // images
  static const String imgDiversityInclusion = "assets/images/diversity_inclusion.png";
  static const String imgWorldCancerDay = "assets/images/world_cancer_day.png";
  static const String imgAndrewsAthletes = "assets/images/andrews_athletes.jpg";
  static const String img46K = "assets/images/forty_six_k.jpg";
  static const String imgDayOfPerformances = "assets/images/day_of_performances.png";
  static const String imgInvolvementFair = "assets/images/involvement_fair.jpg";
  static const String imgUdance2021 = "assets/images/udance_2021.jpg";
  static const String udanceLogoPNG = "assets/images/udance_logo.png";
  static const String udanceLogoFB = "assets/images/udance_logo_fb.jpg";

  /// Path to an image when no image is provided for an event or when the image
  /// fails to load.
  static const String imgDefaultEvent = udanceLogoPNG;
}

class Palette {
  static const Color udanceBlue = Color.fromARGB(255, 53, 104, 177);
}