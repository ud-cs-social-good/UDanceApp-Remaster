import 'package:udance2022/models/list_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants.dart';
import '../models/event_model.dart';

final List<ListItemModel> announcements = [
  ListItemModel(
    title: 'The UDance 2021 app is coming!',
    date: DateTime(2021, 2, 9),
    description:
    "Did you hear? I heard it's being developed by an RSO on campus called CS+SG. We'll have to check it out.",
  ),
  ListItemModel(
    title: 'Announcement 2',
    date: DateTime(2021, 2, 7),
    description:
    'Description for announcement 2. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
  ),
  ListItemModel(
    title: 'Announcement 3',
    date: DateTime(2021, 2, 5),
    description:
    'Description for announcement 3. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
  )

];



final List<EventModel> events = [
  EventModel(
      title: "Andrew's Athletes Campaign",
      imagePath: Constants.imgAndrewsAthletes,
      dateStart: DateTime(2021, 1, 27),
      dateEnd: DateTime(2021, 1, 29),
      address: """UDance Dance Marathon
015L Perkins Student Center
Newark, DE, 19716, United States""",
      addressLink:
      "http://maps.google.com/?q=015L%20Perkins%20Student%20Center%20Newark,%20DE,%2019716%20United%20States",
      googleCalendarLink:
      "http://www.google.com/calendar/event?action=TEMPLATE&text=ANDREW%E2%80%99S%20ATHLETES%20CAMPAIGN&dates=20210127T140000Z/20210130T020000Z&location=015L%20Perkins%20Student%20Center%2C%20Newark%2C%20DE%2C%2019716%2C%20United%20States",
      icsLink:
      "https://www.udancedelaware.org/events/andrews-athletes-campaign?format=ical",
      description:
      "On January 27th, 2007, Andrew McDonough helped lead his team to victory in a soccer state championship. Within 48 hours, Andrew was in cardiac arrest and diagnosed with AML Leukemia. Each year, on January 27th, the athletes at UD honor Andrew and the athlete that he was. This three-day campaign is a time to remember Andrew, highlight our athletic B+ Heroes, and raise funds so that more children get the chance to grow up and become athletes."),
  EventModel(
    title: "Day-of Performances",
    imagePath: Constants.imgDayOfPerformances,
    dateStart: DateTime(2021, 2, 1, 9 + 12, 30),
    dateEnd: DateTime(2021, 2, 10, 10 + 12, 30),
    description:
    "We are now accepting video submissions for day-of performances! All "
        "video submissions will be due on **February 10th**, and following "
        "auditions will be held virtually. Please email your video "
        "submission to [entudance@gmail.com](mailto:entudance@gmail.com) to be considered. "
        "For more information, [click here](https://www.udancedelaware.org/performances)",
    address: """
UDance Dance Marathon
015L Perkins Student Center
Newark, DE, 19716, United States""",
    addressLink:
    "http://maps.google.com/?q=015L%20Perkins%20Student%20Center%20Newark,%20DE,%2019716%20United%20States",
    googleCalendarLink:
    "http://www.google.com/calendar/event?action=TEMPLATE&text=DAY-OF%20PERFORMANCES&dates=20210202T023000Z/20210211T033000Z&location=015L%20Perkins%20Student%20Center%2C%20Newark%2C%20DE%2C%2019716%2C%20United%20States",
    icsLink:
    "https://www.udancedelaware.org/events/day-of-performances?format=ical",
  ),
  EventModel(
      title: "46K in 46 Hours",
      imagePath: Constants.img46K,
      dateStart: DateTime(2021, 2, 3, 9),
      dateEnd: DateTime(2021, 2, 4, 11 + 12, 55),
      googleCalendarLink:
      "http://www.google.com/calendar/event?action=TEMPLATE&text=46K%20In%2046%20Hours&dates=20210203T140000Z/20210205T045500Z&location=015L%20Perkins%20Student%20Center%2C%20Newark%2C%20DE%2C%2019716%2C%20United%20States",
      icsLink:
      "https://www.udancedelaware.org/events/46k-in-46-hours?format=ical",
      description:
      "Join our community as we aim to raise \$46,000 in 46 hours to honor 46 days until UDance 2021 (2/3) and World Cancer Day (2/4). Fundraising materials can be found on our homepage and under the fundraising tab.",
      address: """
UDance Dance Marathon
015L Perkins Student Center
Newark, DE, 19716, United States""",
      addressLink:
      "http://maps.google.com/?q=015L%20Perkins%20Student%20Center%20Newark,%20DE,%2019716%20United%20States"),
  EventModel(
    title: "World Cancer Day",
    imagePath: Constants.imgWorldCancerDay,
    dateStart: DateTime(2021, 2, 4, 0),
    dateEnd: DateTime(2021, 2, 4, 11 + 12, 55),
    // dateStart: "02/04/21",
    address: """
UDance Dance Marathon
015L Perkins Student Center
Newark, DE, 19716, United States""",
    addressLink:
    "http://maps.google.com/?q=015L%20Perkins%20Student%20Center%20Newark,%20DE,%2019716%20United%20States",
    googleCalendarLink:
    "http://www.google.com/calendar/event?action=TEMPLATE&text=WORLD%20CANCER%20DAY&dates=20210204T050000Z/20210205T045500Z&location=015L%20Perkins%20Student%20Center%2C%20Newark%2C%20DE%2C%2019716%2C%20United%20States",
    icsLink:
    "https://www.udancedelaware.org/events/world-cancer-day?format=ical",
    description:
    "This year, UDance and the B+ Nation are aiming to raise \$100,000 to fight childhood cancer on this international day of cancer awareness and we want YOU to join us!",
  ),
  EventModel(
    title: 'Spring Involvement Fair',
    imagePath: Constants.imgInvolvementFair,
    dateStart: DateTime(2021, 2, 16, 5 + 12),
    dateEnd: DateTime(2021, 2, 16, 7 + 12),
    googleCalendarLink: "http://www.google.com/calendar/event?action=TEMPLATE&text=SPRING%20INVOLVEMENT%20FAIR&dates=20210216T220000Z/20210217T000000Z&location=015L%20Perkins%20Student%20Center%2C%20Newark%2C%20DE%2C%2019716%2C%20United%20States",
    icsLink: "https://www.udancedelaware.org/events/spring-involvement-fair?format=ical",
    description:
    'Join UDance at the Spring Involvement Fair! We are so excited to share this day with our newest Blue Hens and we encourage you all to join in on our fight against childhood cancer!',
  ),
  EventModel(
    title: "Diversity & Inclusion Discussion",
    imagePath: Constants.imgDiversityInclusion,
    dateStart: DateTime(2021, 2, 8, 6 + 12),
    dateEnd: DateTime(2021, 2, 8, 7 + 12),
    googleCalendarLink: "http://www.google.com/calendar/event?action=TEMPLATE&text=DIVERSITY%20%26%20INCLUSION%20DISCUSSION&dates=20210208T230000Z/20210209T000000Z&location=015L%20Perkins%20Student%20Center%2C%20Newark%2C%20DE%2C%2019716%2C%20United%20States",
    icsLink: "https://www.udancedelaware.org/events/diversity-inclusion-discussion?format=ical",
    description: """Sit down with UDance and Dr. Latoya Watson & Dr. Erin Knight as we start to open doors to racial disparities within the healthcare system.
This discussion will be a [live Zoom](https://udel.zoom.us/j/93469958880) event open to the UD community on February 8th at 6 pm.
    """
  ),
  EventModel(
    title: 'UDance 2021',
    imagePath: Constants.imgUdance2021,
    dateStart: DateTime(2021, 3, 21, 9),
    dateEnd: DateTime(2021, 3, 21, 9 + 12),
    // dateStart: '03/21/21',
    googleCalendarLink:
    "http://www.google.com/calendar/event?action=TEMPLATE&text=SPRING%20INVOLVEMENT%20FAIR&dates=20210216T220000Z/20210217T000000Z&location=015L%20Perkins%20Student%20Center%2C%20Newark%2C%20DE%2C%2019716%2C%20United%20States",
    icsLink:
    "https://www.udancedelaware.org/events/spring-involvement-fair?format=ical",
    address: """
Bob Carpenter Center
631 South College Avenue
Newark, DE, 19716, United States""",
    addressLink: "http://maps.google.com/?q=631%20South%20College%20Avenue%20Newark,%20DE,%2019716%20United%20States",
    description:
    'UDance is a student-run, year-long effort dedicated to unifying the community while raising awareness for the fight against childhood cancer. It culminates in a 12-hour philanthropic dance marathon every March at The Bob Carpenter Center.',
  ),
  EventModel(
    title: "Test Event",
    dateStart: DateTime(2021, 4, 1),
    description:
    "This is a sample event. If an image is not provided, a default image "
        "can be used, as shown here. Also, if an invalid link is given for "
        "the calendar or map event, or a [hyperlink](httpas://google.com), "
        "a snackbar will be shown. We could also link this up with "
        "Firebase to provide notifications to the UDance team if this "
        "occurs.",
    address: """
Bob Carpenter Center
631 South College Avenue
Newark, DE, 19716, United States""",
    addressLink: "",
    googleCalendarLink: "",
    icsLink: "",
  ),
];
