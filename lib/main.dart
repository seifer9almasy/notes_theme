import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'homepage.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Créez votre TextTheme personnalisé ou utilisez ThemeData.light().textTheme
    final materialTheme = MaterialTheme(ThemeData.light().textTheme);

    return MaterialApp(
      title: 'Mes Notes',
      debugShowCheckedModeBanner: false,
      theme: materialTheme.light(), // Utilise le thème clair
      darkTheme: materialTheme.dark(), // Optionnel : thème sombre
      home: const MyHomePage(),
    );
  }
}
