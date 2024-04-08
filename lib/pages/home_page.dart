import 'package:flutter/material.dart';
import 'package:flutter_app/pages/page_add.dart';
import 'package:flutter_app/pages/page_list.dart';
import 'package:flutter_app/repositories/aluno_repository.dart';
import 'package:flutter_app/widgets/botao_acoes.dart';
import 'package:flutter_app/widgets/botao_navegacao.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  final AlunoRepository alunoRepository = AlunoRepository();

  void setCounter(dynamic value) {
    setState(() {
      counter = value;
    });
  }

  @override
  void initState() {
    super.initState();
    alunoRepository.getAlunosList().then((value) {
      setState(() {
        counter = value.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
            margin: EdgeInsets.all(20),
            child: const Text('Controle de frequência',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            )
          ),
          Expanded(
            child: Center(
              child: Text('$counter',
                  style: const TextStyle(
                      fontSize: 48, fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [BotaoNav(
              label: 'Adicionar participante',
               onpressed: () async {
                final novoValor = await Navigator.push(context, MaterialPageRoute(builder: (context) => const PageAdd()));
                if (novoValor != null) {
                  setCounter(novoValor);
                }
              },
            ),
            SizedBox(height: 12),
            BotaoNav(
              label: 'Ver lista ',
              onpressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => const PageList())).then((value) => setCounter(value));
              },
              
            )],
            ),  
          ),
        ],
      ),
    );
  }
}
