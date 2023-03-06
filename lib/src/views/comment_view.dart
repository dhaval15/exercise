import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class CommentView extends StatelessWidget {
  final Comment comment;

  const CommentView({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme.colorScheme.onSurface.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment.body,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'by ${comment.name}',
            ),
          ),
        ],
      ),
    );
  }
}
