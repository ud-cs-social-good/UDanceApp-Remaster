import 'package:flutter/material.dart';
import 'package:udance2022/pages/events_page.dart';
import 'package:udance2022/pages/announcements_page.dart';
import 'package:udance2022/pages/about_page_single.dart';
import 'package:udance2022/pages/home_page_1.dart';
import 'package:udance2022/pages/links_page.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/udance.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.home_rounded),
            title: Text('Home'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage1()));
            },
          ),
          ListTile(
            leading: Icon(Icons.speaker_notes_rounded),
            title: Text('Announcements'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AnnouncementsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Events'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EventsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Fundraising & Links'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LinksPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutPageSingle()));
            },
          )
        ],
      ),
    );
  }
}
