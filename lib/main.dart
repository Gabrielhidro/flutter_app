import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';

void main() {
  runApp(const ControleLotacao());
}

class ControleLotacao extends StatelessWidget {
  const ControleLotacao({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
