import 'package:flutter/material.dart';

class BotaoNav extends StatelessWidget {
  const BotaoNav({super.key, required this.label, required this.onpressed});

  final String label;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){onpressed();},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 16),  
      ),
    );
  }
}
