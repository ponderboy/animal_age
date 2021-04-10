import 'package:animal_age/config/routes/routing_arguments.dart';
import 'package:animal_age/config/routes/routing_constants.dart';
import 'package:animal_age/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ResultView extends StatelessWidget {
  final ResultViewArguments resultViewArguments;

  const ResultView({Key key, this.resultViewArguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: EdgeInsets.only(top: 0.0),
          children: [
            Container(
              height: 500,
              width: double.infinity,
              child: CachedNetworkImage(
                placeholder: (context, url) => CircularProgressIndicator(),
                imageUrl: '${resultViewArguments.animalImgUrl}',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 70),
              child: Column(
                children: [
                  Text(
                    '${resultViewArguments.animalName},'.toUpperCase(),
                    style: Theme.of(context).textTheme.headline1,
                    // textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    //Use of SizedBox
                    height: 20,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText1,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'has a lifespan of ',
                        ),
                        TextSpan(
                          text: '${resultViewArguments.animalAge}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    //Use of SizedBox
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: DottedLine(
                      direction: Axis.horizontal,
                      lineLength: double.infinity,
                      lineThickness: 2.0,
                      dashLength: 2.0,
                      dashColor: Theme.of(context).primaryColor,
                      dashRadius: 2.0,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Later try to separate this ? What about "context" ?
                      // Navigator.pushNamed(context, HomeViewRoute);
                      Navigator.pop(context, 'fromResult');
                    },
                    child: Text(
                      'Look up a new one!'.toUpperCase(),
                      // style: Theme.of(context).textTheme.button,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        // fontStyle: FontStyle.italic,
                        // letterSpacing: -2,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).accentColor),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
