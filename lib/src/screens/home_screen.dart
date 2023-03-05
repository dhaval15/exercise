import 'package:flutter/material.dart';

import '../models/models.dart';
import '../providers/providers.dart';
import '../views/views.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = PostStoreProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: StreamListBuilder<Post>(
        stream: store.posts,
        builder: (context, post, index) => PostView(
				  key: Key('Post #${post.id}'),
          post: post,
        ),
      ),
    );
  }
}
