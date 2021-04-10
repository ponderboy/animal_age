import 'package:http/http.dart' as http;
import 'dart:convert';

// TODO: Error Managing! If name wrong or no result, what then??
//

bool isFetchError = false;

Future<String> fetchData(String url) async {
  Uri uri = Uri.parse('$url');
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    // print('Response body in fetchData: ${response.body}');
    return response.body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    // throw Exception('Failed to load: Error: ${response.reasonPhrase}');

    // simple workaround to not freeze the app
    // at least works for wolfram
    print('Failed to load: Error: ${response.reasonPhrase}');
    return ', well, we could not figure that out, sorry! Maybe try again?!';
  }
}
