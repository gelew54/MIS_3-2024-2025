import 'package:flutter/material.dart';
import 'screens/joke_types.dart';
import 'screens/random_joke.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Jokes App',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const JokeTypesScreen(),
      routes: {
        '/random': (context) => const RandomJokeScreen(),
      },
    );
  }
}