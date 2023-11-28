import 'package:flutter/material.dart';
import 'package:flutter_application_4/apitask.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(247, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: Api1(),
    );
  }
}
