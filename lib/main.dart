import 'package:flutter/material.dart';

import 'src/apis/apis.dart';
import 'src/providers/providers.dart';
import 'src/screens/screens.dart';
import 'src/stores/stores.dart';

void main() {
  runApp(const ExerciseApp());
}

class ExerciseApp extends StatelessWidget {
  const ExerciseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PostStoreProvider(
      store: PostStore(const PostApi('https://jsonplaceholder.typicode.com')),
      child: MaterialApp(
        title: 'Exercise App',
        onGenerateRoute: const ScreenRouteGenerator(),
				initialRoute: Screens.LOGIN,
				debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
						elevation: 0,
						foregroundColor: Colors.black,
          ),
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
