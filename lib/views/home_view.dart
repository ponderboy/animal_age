import 'dart:convert';
import 'package:animal_age/config/routes/routing_arguments.dart';
import 'package:animal_age/services/api_constants.dart';
import 'package:animal_age/services/fetch_data.dart';
import 'package:animal_age/utils/helpers/show_loader.dart';
import 'package:animal_age/widgets/home_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:animal_age/config/routes/routing_constants.dart';
import 'dart:async';

////////////////////////////////////////////////////////
/// In the end, I would not have needed this,
/// but I found that approach here:
/// https://blog.gskinner.com/archives/2020/02/flutter-widgetview-a-simple-separation-of-layout-and-logic.html
///
////////////////////////////////////////////////////////
/// Widget defines external parameters
////////////////////////////////////////////////////////
class Home extends StatefulWidget {
  final String param;

  const Home({Key key, this.param}) : super(key: key);

  @override
  _HomeController createState() => _HomeController();
}

////////////////////////////////////////////////////////
/// Controller holds state, and all business logic
////////////////////////////////////////////////////////
class _HomeController extends State<Home> {
  String _animalName = 'String';
  String _animalAge = 'String';
  String _animalImgUrl = 'String';
  String errorImgUrl =
      'https://unsplash.com/photos/fe3ijRRVivs/download?force=true&w=640';

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameInputController = TextEditingController();

  Widget build(BuildContext context) => _HomeView(this);

  @override
  void dispose() {
    // Clean up the Textfield Input controller when the widget is disposed.
    nameInputController.dispose();
    super.dispose();
  }

/*
 * Here happens all the logic:
 * - hand over the textfield input
 * - fetch Data from APIs
 * - apply it to our vars
 * - and hand it over to ResultView
 */
  Future<void> handleOnPressed() async {
// apply the text input to our variable
    _animalName = nameInputController.text;
    // TEST: if Values are read out of JSONS are correct
    // print('animalName on Home is: $_animalName');

// show a Loading Dialog
    showLoader(context, 'Looking up the answer');

//Wolfram (ShortAnswer API only returns a plain text string)
    _animalAge = await fetchData('$wolframShortAnswerUrl$_animalName');
    // TEST: if Values are read out of JSONS are correct
    // print('animalAge on Home is: $_animalAge');

// Unsplash
    // Simple Error Handling Workaround
    // if no problem fetch and interpret data
    if (!_animalAge.contains(', sorry!')) {
      // get the raw response
      String responseUnsplash =
          await fetchData('$unsplashFinalUrl$_animalName');
      // decode and apply to proper map variable
      Map<String, dynamic> _unsplashDecoded = jsonDecode(responseUnsplash);
      //no fancy Map Class, because it is only one string we need
      _animalImgUrl = _unsplashDecoded['results'][0]['urls']['regular'];
      // TEST: if Values are read out of JSONS are correct
      // print('_animalImgUrl: $_animalImgUrl');
    }
    // there was an error
    else {
      // pass it the url of our errorimage
      _animalImgUrl = errorImgUrl;
    }

// Close Dialog
    Navigator.pop(context); //popping the dialog after data is fetched

// go to the Result View and pass over Name, Age and ImgUrl
    Navigator.pushNamed(
      context,
      ResultViewRoute,
      arguments: ResultViewArguments(
        '$_animalName',
        '$_animalAge',
        '$_animalImgUrl',
      ),
    );

    return;
  }

// When Enter on Textinput, start the handlePressed as well
  String getOnSubmitted(String value) {
    _animalName = value;
    handleOnPressed();
    return _animalName;
  }
}

////////////////////////////////////////////////////////
/// View is dumb, and purely declarative.
/// Easily references values on the controller and widget
////////////////////////////////////////////////////////
class _HomeView extends StatelessWidget {
  final _HomeController state;
  const _HomeView(this.state, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
// Header Section
          HomeHeader(),
// Main Section
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Hello Tiger,'.toUpperCase(),
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  //Use of SizedBox
                  height: 40,
                ),
                Text(
                  'Wanna know what\'s the lifespan of a:',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  //Use of SizedBox
                  height: 30,
                ),
// TODO: Find good implementation for Format Checking
// and make it a separate utils helper class
// also check: https://pub.dev/packages/mask_text_input_formatter
// TODO 2: Take time to style all those bloody hints and label shit
// so you don't smash another keyboard in anger!
                TextField(
                  autofocus: true,
                  controller: state.nameInputController,
                  onSubmitted: (String value) {
                    state.getOnSubmitted(value);
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'animal name',
                    // hintText: 'animal name',
                    border: UnderlineInputBorder(),
                    labelStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'sans',
                      fontStyle: FontStyle.normal,
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
                    hintText: 'Elephant or Mouse?',
                    // hintStyle: Theme.of(context).textTheme.headline5, // why does not work?
                    hintStyle: TextStyle(
                      fontSize: 24,
                      // fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
                  ),
                  // style: Theme.of(context).textTheme.headline5, // why does not work?
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                SizedBox(
                  //Use of SizedBox
                  height: 70,
                ),
// TextButton
                TextButton(
                  onPressed: state.handleOnPressed,
                  child: Text(
                    'Find out!'.toUpperCase(),
                    // style: Theme.of(context).textTheme.button, // ??
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
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
//Grid Section (for looked up animals in the past) obsolete
        ],
      ),
    );
  }
}
