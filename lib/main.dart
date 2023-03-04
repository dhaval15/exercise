import 'package:flutter/material.dart';

import 'src/apis/apis.dart';
import 'src/providers/providers.dart';
import 'src/screens/screens.dart';

void main() {
  runApp(const ExerciseApp());
}

class ExerciseApp extends StatelessWidget {
  const ExerciseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PostApiProvider(
		  api: const PostApi('https://jsonplaceholder.typicode.com'),
      child: MaterialApp(
        title: 'Exercise App',
			onGenerateRoute: const ScreenRouteGenerator(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}

