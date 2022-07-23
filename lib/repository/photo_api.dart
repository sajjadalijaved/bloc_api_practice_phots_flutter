import 'dart:convert';

import 'package:bloc_api_practice_phots/model_class/photo.dart';
import 'package:http/http.dart';

extension Success on Response {
  bool get isSuccessful => statusCode == 200;
}

class PhotoApiServices {
  final baseURL = 'https://jsonplaceholder.typicode.com';
  final baseURI = '/photos';

  Future<List<Photo>> fetchPhoto() async {
    var response = await get(Uri.parse(baseURL + baseURI));
    List list = jsonDecode(response.body);

    return list.map((e) => Photo.fromMap(e)).toList();
  }
}
