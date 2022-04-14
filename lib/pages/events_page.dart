import 'package:flutter/material.dart';
import '../widgets/empty_state.dart';
import '../widgets/event_tile.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100.0,
        title: Text(
          "Upcoming Events",
          style: Theme.of(context).textTheme.headline5.copyWith(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('events')
              .where('dateStart', isGreaterThanOrEqualTo: DateTime.now())
              .orderBy('dateStart', descending: false)
              .snapshots(),
          builder: (context, snapshotUpcoming) {
            return StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('events')
                    .where('dateStart', isLessThan: DateTime.now())
                    .orderBy('dateStart', descending: true)
                    .snapshots(),
                builder: (context, snapshotPast) {
                  if (!snapshotUpcoming.hasData || !snapshotPast.hasData)
                    return const Text("Loading...");
                  return CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return (snapshotUpcoming.data.docs.length > 0)
                              ? getEventTile(snapshotUpcoming.data.docs[index])
                              : EmptyState();
                        }, childCount: snapshotUpcoming.data.docs.length),
                      ),
                      if (snapshotPast.data.docs.length > 0) ...[
                        SliverToBoxAdapter(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(),
                                Text("Past Events"),
                              ],
                            ),
                          ),
                        ),
                        SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return getEventTile(snapshotPast.data.docs[index]);
                          }, childCount: snapshotPast.data.docs.length),
                        )
                      ],
                    ],
                  );
                });
          }),
    );
  }

  Widget getEventTile(DocumentSnapshot doc) {
    return EventTile(EventModel.fromDocument(doc));
  }
}
