import 'dart:convert';

import 'package:http/http.dart' as https;


var data;
Future<void> getApi() async {
  final response =
      await https.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    data = jsonDecode(response.body.toString());
    print(data);
  } else {}
}
