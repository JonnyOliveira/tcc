class Pet {

  String _nome;
  String _data_nascimento;
  String _idade;
  String _especie;
  String _raca;
  String _porte;
  String _peso;
  String _pelagem;
  String _sexo;
  String _comportamento;
  String _data_castracao;

  Pet();

  Map<String, dynamic> toMap(){

    Map<String, dynamic> map = {
      "nome": this.nome,
      "data_nascimento": this.data_nascimento,
      "idade": this.idade,
      "especie": this.especie,
      "raca": this.raca,
      "porte": this.porte,
      "peso": this.peso,
      "pelagem": this.pelagem,
      "sexo": this.sexo,
      "data_castracao": this.data_castracao,
      "comportamento": this.comportamento
    };

    return map;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get data_nascimento => _data_nascimento;

  set data_nascimento(String value) {
    _data_nascimento = value;
  }

  String get idade => _idade;

  set idade(String value) {
    _idade = value;
  }

  String get especie => _especie;

  set especie(String value) {
    _especie = value;
  }

  String get raca => _raca;

  set raca(String value) {
    _raca = value;
  }

  String get porte => _porte;

  set porte(String value) {
    _porte = value;
  }

  String get peso => _peso;

  set peso(String value) {
    _peso = value;
  }

  String get pelagem => _pelagem;

  set pelagem(String value) {
    _pelagem = value;
  }

  String get sexo => _sexo;

  set sexo(String value) {
    _sexo = value;
  }

  String get comportamento => _comportamento;

  set comportamento(String value) {
    _comportamento = value;
  }

  String get data_castracao => _data_castracao;

  set data_castracao(String value) {
    _data_castracao = value;
  }
}