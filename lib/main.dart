import 'package:flutter/material.dart';

void main() {
  runApp(const ExerciseApp());
}

class ExerciseApp extends StatelessWidget {
  const ExerciseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

