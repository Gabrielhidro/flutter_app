import 'package:flutter/material.dart';
import 'package:flutter_app/models/aluno.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/page_add.dart';
import 'package:flutter_app/repositories/aluno_repository.dart';
import 'package:flutter_app/widgets/aluno_item.dart';
import 'package:flutter_app/widgets/botao_acoes.dart';
import 'package:flutter_app/widgets/botao_navegacao.dart';

class PageList extends StatefulWidget {
  const PageList({super.key});

  @override
  State<PageList> createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  final TextEditingController entradaCtrl = TextEditingController();

  final AlunoRepository alunoRepository = AlunoRepository();

  List<Aluno> alunos = [];

  @override
  void initState() {
    super.initState();
    alunoRepository.getAlunosList().then((value) {
      setState(() {
        alunos = value;
      });
    });
  }
  
  int counter = 0;

  void setCounter(dynamic value) {
    setState(() {
      counter = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: Column(children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(20),
              child: const Text('Lista de participantes',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: BotaoNav(
              label: 'Adicionar participante',
              onpressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => const PageAdd())).then((value) => setCounter(value));
              }
            )
          ),
        ]
      )
    );
  }
}
