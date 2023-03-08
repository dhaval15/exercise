import 'package:exercise/src/models/models.dart';
import 'package:exercise/src/apis/apis.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const api = PostApi('https://jsonplaceholder.typicode.com');
  test('Api should return list of posts', () async {
    final data = await api.getPosts();
    expect(data.runtimeType, List<Post>);
  });
  test('Api should return list of comments for post with id = 1', () async {
    final data = await api.getComments(1);
    expect(data.runtimeType, List<Comment>);
  });
  test('Api should return list of posts for user with id = 1', () async {
    final data = await api.getPostsByUserId(2);
    expect(data.runtimeType, List<Post>);
  });
}
