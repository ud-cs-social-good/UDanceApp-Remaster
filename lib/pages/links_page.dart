import 'package:flutter/material.dart';
import '../widgets/empty_state.dart';
import '../widgets/link_tile.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class LinksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100.0,
        title: Text(
          "Fundraising & Links",
          style: Theme
              .of(context)
              .textTheme
              .headline5
              .copyWith(
              color: Theme
                  .of(context)
                  .accentColor,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('links')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text("Loading...");
          }
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate((BuildContext context,
                    int index) {
                  return (snapshot.data.docs.length > 0)
                      ? getLinkTile(snapshot.data.docs[index])
                      : EmptyState();
                }, childCount: snapshot.data.docs.length),
              ),
            ],
          );
        },
      ),
    );
  }



    Widget getLinkTile(DocumentSnapshot doc) {
      return LinkTile(LinkModel.fromDocument(doc));
    }
  }
/*
class LinksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title: Text('Fundraising'),
          centerTitle:true,

      ),
      body:Center(
        child: ListView(
        children: <Widget> [
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 20.0),
            child: Center(
              child: Text(
                'Discover many ways to support UDance through our various fundraising efforts.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.indigoAccent,
                )
              )
            )
          ),
          Container(
            child: Center(
              child: Image.asset('assets/images/FundraiserTemplate_74.jpeg', scale:3.0)
                )
            ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 3),
            child: Center(
              child: new RichText(
              textAlign: TextAlign.center,
              text: new TextSpan(
                children: [
                  new TextSpan(
                    text: 'Fundraiser Templates',
                    style: new TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold),
                    recognizer: new TapGestureRecognizer()
                      ..onTap=() {
                        launch('https://www.udancedelaware.org/fundraise/#fundraising-guide');
                      }
                  )
                ]
              )
            ),
          ),
          ),
          Container(
            child: Center(
              child: Text(
                   'Use the provided templates to raise funds while articulating UDance’s mission to your donors!',
                   textAlign: TextAlign.center,
            )
          ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
            child: Center(
              child: Image.asset('assets/images/BlueHenvelopes.jpg', scale: 6.0)
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 3),
           child: Center(
             child: new RichText(
             text: new TextSpan(
               children: [
                 new TextSpan(
                   text: 'Blue Henvelopes',
                   style: new TextStyle(
                       color: Colors.black,
                       decoration: TextDecoration.underline,
                       fontWeight: FontWeight.bold,
                   ),
                   recognizer: new TapGestureRecognizer()
                     ..onTap=() {
                       launch('https://www.udancedelaware.org/fundraise/#henvelopes');
                     }
                 )
              ]
              )
             )
            ),
          ),
          Container(
            child: Center(
              child: Text(
                'Send letters to family members, friends, and other contacts to spread awareness & raise funds!',
                textAlign: TextAlign.center,
              )
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Center(
              child: Image.asset('assets/images/UDancegroup.jpg', scale: 4.0),
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 3),
            child: Center(
                child: new RichText(
              text: new TextSpan(
                text: 'Sponsorship',
                style: new TextStyle(
                    color:Colors.black,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold
                ),
                recognizer: new TapGestureRecognizer()
                  ..onTap=() {
                    launch('https://www.udancedelaware.org/matching-gifts');
                  }
              )
              )
            )
            ),
          Container(
            child: Center(
              child: Text(
                'Have a contact in mind who would be interested in a corporate sponsorship? Learn more here!',
                textAlign: TextAlign.center,
              )
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Center(
              child: Image.asset('assets/images/Marathon.jpg', scale: 4.0)
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 3),
            child: Center(
                child: new RichText(
              text: new TextSpan(
                text:'Gift Card Initiative',
                style: new TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold
                ),
                recognizer: new TapGestureRecognizer()
                  ..onTap=() {
                    launch('https://www.udancedelaware.org/fundraise/#gci');
                  }
              )
            )
          ),
          ),
          Container(
            child: Center(
              child: Text(
                'Support the cause by asking for donations from local stores.',
                textAlign: TextAlign.center,
              )
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Center(
              child: Image.asset('assets/images/Little Kid.jpg', scale:10.0),
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 3),
            child: Center(
              child: new RichText(
              text: new TextSpan(
                text: 'Fundraising Tips',
                style:new TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold
                ),
                recognizer: new TapGestureRecognizer()
                  ..onTap=() {
                   launch('https://www.udancedelaware.org/fundraise/#fundraising-tips');
                  }
              )
            )
          ),
          ),
          Container(
            child: Center(
              child: Text(
                'Find tips for ways to fundraise individually and with a group.',
                textAlign: TextAlign.center,
              )
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Center(
              child: Image.asset('assets/images/Canning2.jpg', scale:4.0),
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 3),
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: 'Canning',
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold
                  ),
                  recognizer: new TapGestureRecognizer()
                    ..onTap=() {
                    launch('https://www.udancedelaware.org/fundraise/#canning');
                    }
                )
              )
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Center(
              child: Text(
                'Learn how to mimic canning from the safety of your home.',
                textAlign: TextAlign.center,
              )
            )
          )
        ],
      ),
    )
    );
  }
}*/
