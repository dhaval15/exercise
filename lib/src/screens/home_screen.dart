import 'package:flutter/material.dart';

import '../models/models.dart';
import '../providers/providers.dart';
import '../stores/stores.dart';
import '../views/views.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController scrollController;
  late final PageIndexController pageController;
  late final PostStore store;

  @override
  void initState() {
    store = PostStoreProvider.of(context);
    scrollController = ScrollController();
    pageController = PageIndexController(
      currentIndex: 0,
      onIndexChanged: (index) {
        scrollController.jumpTo(0);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          const SliverAppBar(
            title: Text('Posts'),
          ),
          StreamSliverListBuilder<Post>(
            stream: pageController.stream
                .asyncMap((index) => store.page(index).first),
            builder: (_, post) => PostView(
                key: Key('Post #${post.id}'),
                post: post,
                onTapComments: () async {
                  final comments = await store.api.getComments(post.id);
                  Navigator.of(context)
                      .pushNamed(Screens.COMMENTS, arguments: comments);
                }),
          ),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.center,
              child: StreamBuilder<int>(
                stream: store.numberOfPages,
                builder: (context, snapshot) => snapshot.hasData
                    ? PageIndexView(
                        controller: pageController,
                        totalIndices: snapshot.data!,
                        numberOfIndicesToShow: 3,
                      )
                    : const SizedBox(),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const ListTile(
              title: Text('Home'),
            ),
            ListTile(
              title: const Text('Sign Out'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(Screens.LOGIN);
              },
            ),
          ],
        ),
      ),
    );
  }
}
