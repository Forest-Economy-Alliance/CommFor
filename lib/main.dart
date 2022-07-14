import 'package:flutter/material.dart';
import 'package:ifri/ui/section_b/screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IFRI',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const Screen1(),
    );
  }
}
