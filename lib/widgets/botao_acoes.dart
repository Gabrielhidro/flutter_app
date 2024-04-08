import 'package:flutter/material.dart';

class BotaoAcoes extends StatelessWidget {
  const BotaoAcoes({super.key, required this.label, required this.onpressed});

  final String label;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onpressed();
      },
      child: Text(label),
    );
  }
}
