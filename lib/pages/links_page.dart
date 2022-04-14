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
