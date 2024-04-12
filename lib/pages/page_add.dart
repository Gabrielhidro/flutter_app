import 'package:flutter/material.dart';
import 'package:flutter_app/models/aluno.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/repositories/aluno_repository.dart';
import 'package:flutter_app/widgets/aluno_item.dart';
import 'package:flutter_app/widgets/botao_acoes.dart';
import 'package:flutter_app/widgets/botao_navegacao.dart';

class PageAdd extends StatefulWidget {
  const PageAdd({super.key});

  @override
  State<PageAdd> createState() => _PageAddState();
}

class _PageAddState extends State<PageAdd> {
  String? errorMessage;
  final TextEditingController nomeCtrl = TextEditingController();
  final TextEditingController periodoCtrl = TextEditingController();

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

  void capturar() {
    String valorNome = nomeCtrl.text;
    String valorPeriodo = periodoCtrl.text;

    if (valorPeriodo == '' || valorNome == '') {
      setState(() {
        errorMessage = 'Preencha todos os campos';
      });
    } else {
      setState(() {
        Aluno newAluno = Aluno(nome: valorNome, periodo: valorPeriodo);
        alunos.add(newAluno);
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
      });
    }
    nomeCtrl.clear();
    periodoCtrl.clear();
    alunoRepository.saveAlunosList(alunos);
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
              child: const Text('Adicionar participante',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: nomeCtrl,
                    decoration: InputDecoration(
                      labelText: 'Usuário',
                      border: OutlineInputBorder(),
                      hintText: 'Digite alguma coisa',
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  TextField(
                    controller: periodoCtrl,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                      hintText: 'Digite alguma coisa',
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  if (errorMessage != null)
                    Text(
                      errorMessage!,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: BotaoNav(
              label: 'Salvar',
              onpressed: () {
                capturar();
              }
            )
          ),
        ]
      )
    );
  }
}
