import 'dart:convert';

import 'package:ephrom/controller/core/error/exceptions.dart';

import '../../model/post_model.dart';
import 'package:http/http.dart' as http;

abstract class PostDataSource {
  Future<List<PostModel>> getPosts();
}

class PostDataSourceImpl implements PostDataSource {
  final http.Client client;

  PostDataSourceImpl({required this.client});

  @override
  Future<List<PostModel>> getPosts() =>
      _getPostFromUrl('https://api.mocki.io/v1/f932124c/posts');

  Future<List<PostModel>> _getPostFromUrl(String urlString) async {
    final url = Uri.parse(urlString);
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return (json.decode(response.body)["Result"] as List)
          .map((e) => PostModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
