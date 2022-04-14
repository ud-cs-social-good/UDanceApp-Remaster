import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/side_menu.dart';
import '../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/announcement_model.dart';
import '../pages/announcement_page.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AnnouncementsPage extends StatefulWidget {
  @override
  _AnnouncementsPageState createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100.0,
        title: Text(
          'Announcements',
          style: Theme.of(context).textTheme.headline5.copyWith(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: StreamBuilder(
        stream:FirebaseFirestore.instance.collection('announcements').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text("Loading...");
          return ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(15.0),
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index){
                return Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: ListTile(
                          title: Text(snapshot.data.docs[index]['title']),
                          tileColor: Theme.of(context).primaryColor,
                          contentPadding: EdgeInsets.all(30.0),
                          enabled: true,
                          leading: CircleImage(imagePath: snapshot.data.docs[index]['flag']),
                          subtitle: Text("Location: " + snapshot.data.docs[index]['location'] + '\n' + snapshot.data.docs[index]['text'] +" preview",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnnouncementPage(AnnouncementModel.fromDocument(snapshot.data.docs[index]))
                              )
                            )
                          },
                        ),
                      ),
                      SizedBox(height: 15),
                    ]
                );
              });
        }
      )
      );
  }
}

class CircleImage extends StatelessWidget {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  CircleImage({
    Key key,
    this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: storage.ref(imagePath).getDownloadURL(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return CircleAvatar(
              backgroundImage: NetworkImage(snapshot.data),
              radius: 40,
            );
          } else {
            return CircleAvatar(
              backgroundImage: AssetImage(Constants.imgDefaultEvent),
              radius: 40,
            );
          }
        }
    );
  }

}

