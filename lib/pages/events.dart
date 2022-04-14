import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Upcoming Events'),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class EventWidget extends StatelessWidget {
  String eventTitle;
  String eventDescription;
  //Image eventImage;
  DateTime eventDate;

  EventWidget(String title, String descrip, String date) {
    this.eventTitle = title;
    this.eventDescription = descrip;
    this.eventDate = DateFormat('MM/dd/yy').parse(date);
    //this.eventImage = img;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        color: Colors.amber[500],
        child: Column(
          children: <Widget>[
            Text(this.eventTitle),
            Text(this.eventDescription),
            Text(DateFormat('MM/dd/yy').format(this.eventDate))
          ],
        ));
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<String> descriptions = <String>[
    'Description A',
    'Description B',
    'Description C'
  ];
  final List<int> colorCodes = <int>[600, 500, 100];
  final List<EventWidget> events = <EventWidget>[
    EventWidget("Event A", "Description A", "01/19/21"),
    EventWidget("Event B", "descrip B", "02/15/21"),
    EventWidget("Third Event", "description C", "12/12/20")
  ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    events.sort((a, b) => a.eventDate.compareTo(b.eventDate));
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: events.length,
            itemBuilder: (BuildContext context, int index) {
              return events[index].build(context);
              //   Container(
              //   height: 50,
              //   color: Colors.amber[500],
              //   child: Column(
              //       children: <Widget>[
              //         Text('Entry ${entries[index]}'),
              //         Text('Description for ${descriptions[index]}')
              //       ],
              //   )
              // );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ));
  }
}
