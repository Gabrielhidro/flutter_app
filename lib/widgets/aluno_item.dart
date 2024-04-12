import 'package:flutter/material.dart';

class AlunoItem extends StatelessWidget {
  const AlunoItem(
      {super.key,
      required this.nomeAluno,
      required this.periodoAluno,
      required this.onPressed});

  final String nomeAluno;
  final String periodoAluno;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.blue[200],
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            offset: Offset(2, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nome : $nomeAluno',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            'Período: $periodoAluno',
            style: TextStyle(fontSize: 12),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                onPressed();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.delete),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
