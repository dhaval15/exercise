import '../apis/apis.dart';
import '../models/models.dart';
import 'rivulet.dart';

class PostStore {
  final Rivulet<List<Post>> _posts;
  final int pageSize;
  final PostApi api;

  PostStore(this.api, [this.pageSize = 20])
      : _posts = Rivulet(onInit: api.getPosts, data: []);

  Stream<List<Post>> get posts => _posts.stream;

  Stream<int> get numberOfPages => _posts.stream.map((data) =>
      (data.length / pageSize).floor() + (data.length % pageSize > 0 ? 1 : 0));

  Stream<List<Post>> page(int page) => _posts.stream.map(
        (data) => data.sublist(page * pageSize, (page + 1) * pageSize),
      );
}
