// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Usuario {
  String nome;
  String email;
  String senha;
  Usuario({
    this.nome,
    this.email,
    this.senha,
  });

  Usuario copyWith({
    String nome,
    String email,
    String senha,
  }) {
    return Usuario(
      nome: nome ?? this.nome,
      email: email ?? this.email,
      senha: senha ?? this.senha,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      nome: map['nome'] as String,
      email: map['email'] as String,
      senha: map['senha'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) =>
      Usuario.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Usuario(nome: $nome, email: $email, senha: $senha)';

  @override
  bool operator ==(covariant Usuario other) {
    if (identical(this, other)) return true;

    return other.nome == nome && other.email == email && other.senha == senha;
  }

  @override
  int get hashCode => nome.hashCode ^ email.hashCode ^ senha.hashCode;
}
