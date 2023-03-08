import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../models/models.dart';

class CommentView extends StatelessWidget {
  final Comment comment;
  final Color avatarColor;

  const CommentView({
    super.key,
    required this.avatarColor,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPaint(
          painter: ExtraPainter(
            color: theme.colorScheme.onSurface.withOpacity(0.1),
          ),
          child: const SizedBox(height: 24, width: 24),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurface.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12).copyWith(topLeft: Radius.zero),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: avatarColor,
                  child: Text(comment.email[0]),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment.email,
                        style: TextStyle(color: theme.colorScheme.primary),
                      ),
                      Text(comment.body),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class ExtraPainter extends CustomPainter {
  final Color color;

  ExtraPainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width;
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(radius, 0);
    path.lineTo(radius, radius);
    path.addArc(
        Rect.fromLTWH(-radius, 0, radius * 2, radius * 2), 0, -math.pi / 2);
    path.close();
    canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.fill
          ..color = color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is ExtraPainter) {
      return color != oldDelegate.color;
    }
    return true;
  }
}
