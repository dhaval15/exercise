import 'package:flutter/material.dart';

import '../models/models.dart';
import '../views/views.dart';
import '../widgets/widgets.dart';

class CommentsScreen extends StatelessWidget {
  final String postTitle;
  final List<Comment> comments;
  const CommentsScreen({
    super.key,
    required this.postTitle,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(postTitle),
          ),
          StreamSliverListBuilder<Comment>(
					  stream: Stream.value(comments),
            builder: (context, comment) => CommentView(
              key: Key('Comment #${comment.id}'),
              comment: comment,
            ),
          ),
        ],
      ),
    );
  }
}
