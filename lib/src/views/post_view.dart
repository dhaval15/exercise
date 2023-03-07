import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class PostView extends StatelessWidget {
  final Post post;
  final GestureTapCallback? onTapUserId;
  final GestureTapCallback? onTapComments;

  const PostView({
    super.key,
    required this.post,
    this.onTapUserId,
    this.onTapComments,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme.colorScheme.onSurface.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: theme.textTheme.titleLarge,
          ),
          Text(
            post.body,
          ),
          if (onTapUserId != null)
            Align(
              alignment: Alignment.centerRight,
              child: RichText(
                text: TextSpan(
                  text: 'by ${post.userId}',
                  style: DefaultTextStyle.of(context).style.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                  recognizer: TapGestureRecognizer()..onTap = onTapUserId,
                ),
              ),
            ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: onTapComments,
              child: const Text('Comments'),
            ),
          ),
        ],
      ),
    );
  }
}
