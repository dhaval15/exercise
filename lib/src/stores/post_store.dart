import '../apis/apis.dart';
import '../models/models.dart';
import 'rivulet.dart';

class PostStore {
  final Rivulet<List<Post>> _posts;

  PostStore(PostApi api) : _posts = Rivulet(onInit: api.getPosts, data: []);

	Stream<List<Post>> get posts => _posts.stream;
}
