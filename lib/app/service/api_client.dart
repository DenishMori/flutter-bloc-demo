import 'dart:convert';

import 'package:bloc_demo/core/const/const.dart';
import 'package:bloc_demo/core/model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<List<PostModel>> getPostDetails() async {
    final response = await http.get(
      Uri.parse(Constant.baseUrl),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final body = jsonDecode(response.body);
      List<PostModel> postModel =
          (body as List<dynamic>).map((e) => PostModel.fromJson((e))).toList();

      return postModel;
    }
    return [];
  }
}
