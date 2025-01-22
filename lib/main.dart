import 'package:flutter/material.dart';
import 'package:notes_apk/pages/Note.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: const Note(),
    );
  }
}
