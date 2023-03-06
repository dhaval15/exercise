import 'package:flutter/widgets.dart';

import '../stores/stores.dart';

class PostStoreProvider extends InheritedWidget {
  final PostStore _store;

  const PostStoreProvider({
    super.key,
    required PostStore store,
    required super.child,
  }) : _store = store;

  static PostStore of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<PostStoreProvider>()!._store;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return oldWidget is PostStoreProvider && (oldWidget)._store == _store;
  }
}
