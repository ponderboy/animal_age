import 'package:flutter/material.dart';

void showLoader(BuildContext context, String text) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "$text",
            // style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
