import 'package:flutter/material.dart';

import '../models/models.dart';
import '../providers/providers.dart';
import '../views/views.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class PostsScreen extends StatelessWidget {
  final List<Post> posts;

  const PostsScreen({super.key, required this.posts});
  @override
  Widget build(BuildContext context) {
    final store = PostStoreProvider.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Posts'),
          ),
          StreamSliverListBuilder<Post>(
					  padding: const EdgeInsets.all(16),
            stream: Stream.value(posts),
            builder: (_, post) => PostView(
              key: Key('Post #${post.id}'),
              post: post,
              onTapComments: () async {
                final comments = await store.api.getComments(post.id);
                Navigator.of(context)
                    .pushNamed(Screens.COMMENTS, arguments: comments);
              },
            ),
          ),
        ],
      ),
    );
  }
}
