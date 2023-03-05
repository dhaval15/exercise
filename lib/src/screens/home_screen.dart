import 'package:flutter/material.dart';

import '../models/models.dart';
import '../providers/providers.dart';
import '../views/views.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final api = PostApiProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: FutureBuilder<List<Post>>(
        future: api.getPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final post = snapshot.data![index];
                return PostView(
                  key: Key('Post #${post.id}'),
                  post: post,
                );
              },
            );
          } else {
            return Text(snapshot.error?.toString() ?? 'Loading');
          }
        },
      ),
    );
  }
}
