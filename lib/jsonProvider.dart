import 'dart:convert';
//import 'dart:io';
import 'package:http/http.dart' as http;
//import 'package:path_provider/path_provider.dart';

class ApiProvider {
  String username;
  int score;

  ApiProvider(this.username, this.score);
  ApiProvider.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    username = json['username'];
  }
  Future getData() async {
    //fetch from database
    final url = "http://flutter-database.herokuapp.com/users";
    print('Fetch from network');

    final request = await http.get(url);
    if (request.statusCode == 200) {
      final body = request.body;
      final response = json.decode(body);
      return response;
    } else {
      return json.decode(request.body);
    }
  }
}

// Future getData() async {
//   final url = "http://flutter-database.herokuapp.com/users";
//   String fileName = "pathString.json"; // to store the data inside
//   var dir = await getTemporaryDirectory();
//   File file = File(dir.path + "/" + fileName);

//   if (file.existsSync()) {
//     print('Reading from device cache');

//     //read from cache
//     final data = file.readAsStringSync();
//     final res = json.decode(data);

//     return res;
//   } else {
//     print('Fetch from network');
//     //fetch from network
//     final request = await http.get(url);

//     if (request.statusCode == 200) {
//       final body = request.body;
//       //store data to cache
//       file.writeAsStringSync(body, flush: true, mode: FileMode.write);

//       final response = json.decode(body);
//       return response;
//     } else {
//       return json.decode(request.body);
//     }
//   }
// }
