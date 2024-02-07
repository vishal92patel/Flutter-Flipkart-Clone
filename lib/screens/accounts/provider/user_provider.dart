import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../bloc/modal/user_modal.dart';

class UserProvider {
  Future<UserModal> getUser() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.npoint.io/1f2f29ba66efcac29efa'));
      return UserModal.fromJson(jsonDecode(response.body));
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
