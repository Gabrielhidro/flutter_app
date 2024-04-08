import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/models/aluno.dart';

class AlunoRepository {
  late SharedPreferences sharedData;

  Future<List<Aluno
  >> getAlunosList() async {
    sharedData = await SharedPreferences.getInstance();
    final String jsonAlunos = sharedData.getString('alunos_list') ?? '[]';
    final List alunosJsonDecoded = json.decode(jsonAlunos) as List;
    return alunosJsonDecoded.map((e) => Aluno.fromJson(e)).toList();
  }

  void saveAlunosList(List<Aluno> alunos) {
    final String jsonAlunos = json.encode(alunos);
    sharedData.setString('alunos_list', jsonAlunos);
  }
}
