import 'package:flutter/material.dart';

class ProminentAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      flexibleSpace: Center(
        child: FractionallySizedBox(
            heightFactor: 0.7,
            child: Image.asset('assets/images/udance_logo.png')),
      ),
    );
  }
}
