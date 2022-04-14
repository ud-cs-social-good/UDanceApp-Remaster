import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../constants.dart';

class AboutPageSingle extends StatelessWidget {
  String title = "";
  String description = "";
  String imagePath = "";


  @override build(BuildContext context) {
    final deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    final deviceHeight = MediaQuery
        .of(context)
        .size
        .height;

    double expandedFraction = .4;
    if (expandedFraction < 0) expandedFraction = 0;
    final double expandedHeight = deviceHeight * expandedFraction;

    const double titlePadding = 16;
    final double titleWidth = deviceWidth - titlePadding * 2;


    return FutureBuilder < DocumentSnapshot > (
        future: FirebaseFirestore.instance.collection('about')
        .doc('about')
        .get(),
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    if (snapshot.hasData) {
    this.title = snapshot.data!['title'];
    this.description = snapshot.data!['description'];
    this.imagePath = snapshot.data!['photo'];

    return Scaffold(
    appBar: AppBar(
    title: Text("About Us"),
    ),
    body: SafeArea(
    child: Stack(
    children: [
    SingleChildScrollView(
    physics: ClampingScrollPhysics(),
    child: Column(
    children: [
    Container(
    width: deviceWidth,
    height: expandedHeight,
    child: GetImage(imagePath: this.imagePath)
    ),
    Container(
    alignment: Alignment.bottomLeft,
    margin: const EdgeInsets.only(
    top: titlePadding, bottom: titlePadding),
    // height: textHeight,
    width: titleWidth,
    child: AutoSizeText(
    this.title.toUpperCase(),
    style: Theme.of(context).textTheme.headline3!.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.4,
    color: Theme.of(context).accentColor,
    ),
    maxLines: 2,
    )),
    Container(
    margin: const EdgeInsets.only(
    top: titlePadding, bottom: titlePadding),
    // height: textHeight,
    width: titleWidth,
    child: MarkdownBody(data: this.description)
    )
    ],
    )
    )
    ]
    )
    )
    );
    } else {
      return Text("Loading...");
    }
    }
    );
  }
}

class GetImage extends StatelessWidget {
  final String imagePath;

  GetImage({
    Key? key,
    this.imagePath = ""
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    Widget image =
    Image.network(imagePath,
      fit: BoxFit.cover,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace stackTrace) {
        return Image.asset(Constants.imgDefaultEvent);
      },
    );

    return image;
  }
}