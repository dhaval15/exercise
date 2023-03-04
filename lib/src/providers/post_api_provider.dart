import 'package:flutter/widgets.dart';

import '../apis/apis.dart';

class PostApiProvider extends InheritedWidget {
  final PostApi _api;

  const PostApiProvider({
    super.key,
    required PostApi api,
    required super.child,
  }) : _api = api;

  static PostApi of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<PostApiProvider>()!._api;

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return oldWidget is PostApiProvider && (oldWidget)._api == _api;
  }
}
