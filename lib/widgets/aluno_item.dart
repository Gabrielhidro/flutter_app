import 'package:flutter/material.dart';

class AlunoItem extends StatelessWidget {
  const AlunoItem({super.key, required this.nomeAluno});

  final String nomeAluno;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.blue[200],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nomeAluno,
            style: const TextStyle(fontSize: 16),
          ),
          const Text(
            'Frequência: 0%',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
