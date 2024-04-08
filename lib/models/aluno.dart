class Aluno {
  Aluno({required this.nome, required this.periodo});

  Aluno.fromJson(Map<String, dynamic> json) : nome = json['nome'], periodo = json['periodo'];
  String nome;
  String periodo;

  toJson() {
    return {
      'nome': nome,
      'periodo': periodo,
    };
  }
}
