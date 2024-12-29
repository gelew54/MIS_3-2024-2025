import 'package:flutter/material.dart';
import 'firebase.options.dart';
import 'screens/joke_types.dart';
import 'screens/random_joke.dart';
import 'screens/favorite_jokes.dart';
import 'models/joke.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/NotificationService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check if Firebase has already been initialized before calling initializeApp
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print("Firebase initialization error: $e");
  }

  await NotificationService().initialize();
  runApp(MyApp());
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
        '/favorites': (context) => FavoriteJokesScreen(favoriteJokes: favoriteJokes),
      },
    );
  }
}

List<Joke> favoriteJokes = [];
