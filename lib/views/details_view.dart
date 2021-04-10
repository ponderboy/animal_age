import 'package:flutter/material.dart';

// TODO: add Hero so we have a nice animation from the grid later
//
//

class DetailView extends StatelessWidget {
  final String argument;

  const DetailView({Key key, this.argument}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, 'fromDetail');
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              child: Image.asset(
                'assets/images/detail.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              child: AppBar(
                // title: Text("Transparent AppBar"),
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {},
                    tooltip: 'Share',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
