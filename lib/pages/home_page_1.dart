import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../data/data.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final double appBarFraction = 0.25;
  VideoPlayerController _videoController;

  @override
  void initState() {
    _videoController = VideoPlayerController.asset("assets/video.mp4")
      ..initialize().then((_) {
        _videoController.setVolume(0);
        _videoController.play();
        _videoController.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: VisibilityDetector(
        key: Key('video key'),
        onVisibilityChanged: (VisibilityInfo info) {
          if (info.visibleFraction < 1) {
            _videoController.play();
          } else {
            _videoController.pause();
          }
        },
        child: NavDrawer(),
      ),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(
              MediaQuery.of(context).size.height * appBarFraction),
          child: SafeArea(
            child: Stack(
              children: [
                SizedBox.expand(
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                          width: _videoController.value.size?.width ?? 0,
                          height: _videoController.value.size?.height ?? 0,
                          child: VideoPlayer(_videoController))),
                ),
                ProminentAppBar(),
              ],
            ),
          )),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // const SizedBox(height: 8),
                // const Divider(thickness: 2, color: Palette.udanceBlue),
                // const SectionHeader(text: 'Announcements'),
                // ListSection(items: _getAnnouncements(), maxLines: 3),
                const Divider(thickness: 2, color: Palette.udanceBlue),
                const SizedBox(height: 15),
                const Divider(thickness: 2, color: Palette.udanceBlue),
                new InkWell(
                  child: Center(child: new RichText(
                      text: TextSpan(
                          text: 'Donate to UDance Here!',
                        style: TextStyle(
                          color: Palette.udanceBlue,
                          fontSize: 30,
                          decoration: TextDecoration.underline
                        ),
                      ),
                    textAlign: TextAlign.justify,
                  )
                  ),
                  onTap: () => launch('https://www.udancede.org/bpos_index.aspx?eventtag=ud2022')
                ),
                const Divider(thickness: 2, color: Palette.udanceBlue),
                const SizedBox(height: 10),
                SectionHeader(text: 'Upcoming Events'),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('events')
                      .where('dateStart',
                          isGreaterThanOrEqualTo: DateTime.now())
                      .orderBy('dateStart', descending: false)
                      .limit(2)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Text("Loading");
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return EventTile(
                          EventModel.fromDocument(snapshot.data.docs[index]),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Returns list of announcements sorted by date with the most recent
  /// announcement first in the list.
  List<ListItemModel> _getAnnouncements() {
    List<ListItemModel> result = [];
    List<ListItemModel> noDateList = [];
    announcements.forEach((element) {
      if (element.date != null) {
        result.add(element);
      } else {
        noDateList.add(element);
      }
    });
    result.sort((a, b) {
      return b.date.compareTo(a.date);
    });
    result.addAll(noDateList);
    return result;
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }
}
