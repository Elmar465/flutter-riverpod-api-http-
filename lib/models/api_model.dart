import 'package:flutter_api/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'dart:convert';

class ApiService {
  String endpoint = 'https://fakestoreapi.com/users';

  Future<List<User>> getUser() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
