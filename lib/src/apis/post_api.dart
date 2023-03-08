import 'dart:convert';

import 'package:http/http.dart';

import '../models/models.dart';

class PostApi {
  final String _baseUrl;
  static const decoder = JsonDecoder();

  const PostApi(this._baseUrl);

  Future<List<Comment>> getComments(int postId) async {
    final response = await get(Uri.parse('$_baseUrl/posts/$postId/comments'));
    final data = decoder.convert(response.body);
    return <Comment>[for (final json in data) Comment.fromJson(json)];
  }

  Future<List<Post>> getPosts() async {
    final response = await get(Uri.parse('$_baseUrl/posts'));
    final data = decoder.convert(response.body);
    return <Post>[for (final json in data) Post.fromJson(json)];
  }

  Future<List<Post>> getPostsByUserId(int userId) async {
    final response = await get(Uri.parse('$_baseUrl/users/$userId/posts'));
    final data = decoder.convert(response.body);
    return <Post>[for (final json in data) Post.fromJson(json)];
  }
}
