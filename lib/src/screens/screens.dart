import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'login_screen.dart';
import 'comments_screen.dart';
import 'posts_screen.dart';

typedef ScreenBuilder = Widget Function(
    BuildContext context, Object? arguments);

class ScreenRouteGenerator {
  final Map<String, ScreenBuilder> overrides;
  final Map<String, String> redirects;

  const ScreenRouteGenerator({
    this.overrides = const {},
    this.redirects = const {},
  });

  static final Map<String, ScreenBuilder> _routes = {
    Screens.LOGIN: (context, args) => const LoginScreen(),
    Screens.HOME: (context, args) => const HomeScreen(),
    Screens.COMMENTS: (context, dynamic args) => CommentsScreen(comments: args),
    Screens.POSTS: (context, dynamic args) => PostsScreen(posts: args),
  };

  /// Finds [ScreenBuilder] in order of :
  /// [overides] > [redirects] > [_routes]
  ScreenBuilder? _find(String? name) {
    final override = overrides[name];
    if (override != null) return override;
    final redirect = redirects[name];
    if (redirect != null) return _routes[redirect];
    return _routes[name];
  }

  /// By implementing call method, we can use instance of
  /// [ScreenGenerator] for onGenerateRoute for [Navigator]
  MaterialPageRoute call(RouteSettings settings) {
    final builder = _find(settings.name);
    if (builder != null) {
      return MaterialPageRoute(
          builder: (context) => builder(context, settings.arguments));
    }
    throw Exception('${settings.name} route not found');
  }
}

class Screens {
  static const HOME = '/';
  static const LOGIN = '/login';
  static const COMMENTS = '/comments';
  static const POSTS = '/posts';
}
