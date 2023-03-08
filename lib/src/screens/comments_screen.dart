import 'package:flutter/material.dart';

import '../models/models.dart';
import '../views/views.dart';
import '../widgets/widgets.dart';

class CommentsScreen extends StatelessWidget {
  final List<Comment> comments;
  const CommentsScreen({
    super.key,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Comments'),
          ),
          StreamSliverListBuilder<Comment>(
            stream: Stream.value(comments),
            divider: const SizedBox(height: 6),
						padding: const EdgeInsets.all(12),
            builder: (context, comment) => CommentView(
              key: Key('Comment #${comment.id}'),
              comment: comment,
              avatarColor: comment.id % 2 == 0 ? Colors.pink : Colors.indigo,
            ),
          ),
        ],
      ),
    );
  }
}
