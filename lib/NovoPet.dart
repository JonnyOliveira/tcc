import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_app/model/Pet.dart';

import 'Padrao/PdAppBar.dart';
import 'Padrao/PdDrawer.dart';

class NovoPet extends StatefulWidget {
  const NovoPet({Key key}) : super(key: key);

  @override
  _PetState createState() => _PetState();
}

class _PetState extends State<NovoPet> {

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerDataNascimento = TextEditingController();
  TextEditingController _controllerIdade = TextEditingController();
  TextEditingController _controllerRaca = TextEditingController();
  TextEditingController _controllerPeso = TextEditingController();
  TextEditingController _controllerDataCastracao = TextEditingController();
  TextEditingController _controllerComportamento = TextEditingController();
  String _mensagemErroEmail = "";
  String _mensagemErroSenha = "";

  String _dropdownEspecie = 'Ave';
  String _dropdownPelagem = 'Curta';
  String _dropdownSexo = 'Fêmea';
  String _dropdownPorte = 'Mini';
  String _especie = '';
  String _pelagem = '';
  String _sexo = '';
  String _porte = '';

  _validarCampos(){

    String nome = _controllerNome.text;
    String data_nascimento = _controllerDataNascimento.text;
    String idade = _controllerIdade.text;
    String especie = _dropdownEspecie;
    String raca = _controllerRaca.text;
    String porte = _dropdownPorte;
    String peso = _controllerPeso.text;
    String pelagem = _dropdownPelagem;
    String sexo = _dropdownSexo;
    String data_castracao = _controllerDataCastracao.text;
    String comportamento = _controllerComportamento.text;

    if( nome.isNotEmpty ){
          setState(() {
            _mensagemErroEmail = "";
          });

          Pet pet = Pet();
          pet.nome = nome;
          pet.data_nascimento = data_nascimento;
          pet.idade = idade;
          pet.especie = especie;
          pet.raca = raca;
          pet.porte = porte;
          pet.peso = peso;
          pet.pelagem = pelagem;
          pet.sexo = sexo;
          pet.data_castracao = data_castracao;
          pet.comportamento = comportamento;

          _cadastrarPet( pet );
          print('deu certo');

    }else{
        setState(() {
          _mensagemErroEmail = "Informe o Nome";
        });
    }
  }

  _cadastrarPet( Pet pet ) async {

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;

    //Salvar dados do pet
    FirebaseFirestore db = FirebaseFirestore.instance;

    db.collection("pets")
        .doc( '01' )
        .set( pet.toMap() );
  }

  @override
  void initState() {
    super.initState();

    _controllerNome.addListener(() => setState(() {}));
    _controllerDataNascimento.addListener(() => setState(() {}));
    _controllerIdade.addListener(() => setState(() {}));
    _controllerRaca.addListener(() => setState(() {}));
    _controllerPeso.addListener(() => setState(() {}));
    _controllerDataCastracao.addListener(() => setState(() {}));
    _controllerComportamento.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarPadrao('Pet'),
        drawer: DrawerPadrao(),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: _controllerNome,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                                hintText: "Nome",
                                suffixIcon: _controllerNome.text.isEmpty
                                    ? Container(width: 0)
                                    : IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      setState(() {
                                        _controllerNome.text = '';
                                      });
                                    }
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: _controllerDataNascimento,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                                hintText: "Data de Nascimento",
                                suffixIcon: _controllerDataNascimento.text.isEmpty
                                    ? Container(width: 0)
                                    : IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      setState(() {
                                        _controllerDataNascimento.text = '';
                                      });
                                    }
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                            onTap: () async {
                              final DateTime date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2150)
                              );
                              if (date != null) {
                                setState(() {
                                  _controllerDataNascimento.text = DateFormat('d/MM/yyyy').format(date);
                                });
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: _controllerIdade,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                                hintText: "Idade",
                                suffixIcon: _controllerIdade.text.isEmpty
                                    ? Container(width: 0)
                                    : IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      setState(() {
                                        _controllerIdade.text = '';
                                      });
                                    }
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.90,
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _dropdownEspecie,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        _dropdownEspecie = newValue;
                                        _especie = newValue;
                                      });
                                    },
                                    items: <String>['Ave', 'Canino', 'Felino', 'Réptil', 'Roedor']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                )
                            )
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: _controllerRaca,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                                hintText: "Raça",
                                suffixIcon: _controllerRaca.text.isEmpty
                                    ? Container(width: 0)
                                    : IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      setState(() {
                                        _controllerRaca.text = '';
                                      });
                                    }
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.90,
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _dropdownPorte,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        _dropdownPorte = newValue;
                                        _porte = newValue;
                                      });
                                    },
                                    items: <String>['Mini', 'Pequeno', 'Médio', 'Grande', 'Gigante']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                )
                            )
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: _controllerPeso,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                                hintText: "Peso",
                                suffixIcon: _controllerPeso.text.isEmpty
                                    ? Container(width: 0)
                                    : IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      setState(() {
                                        _controllerPeso.text = '';
                                      });
                                    }
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.90,
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _dropdownPelagem,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        _dropdownPelagem = newValue;
                                        _pelagem = newValue;
                                      });
                                    },
                                    items: <String>['Curta', 'Média', 'Longa']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                )
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.90,
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _dropdownSexo,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        _dropdownSexo = newValue;
                                        _sexo = newValue;
                                      });
                                    },
                                    items: <String>['Fêmea', 'Macho']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                )
                            )
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: _controllerDataCastracao,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                                hintText: "Data Castração",
                                suffixIcon: _controllerDataCastracao.text.isEmpty
                                    ? Container(width: 0)
                                    : IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      setState(() {
                                        _controllerDataCastracao.text = '';
                                      });
                                    }
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                            onTap: () async {
                              final DateTime date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2150)
                              );
                              if (date != null) {
                                setState(() {
                                  _controllerDataCastracao.text = DateFormat('d/MM/yyyy').format(date);
                                });
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: _controllerComportamento,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                                hintText: "Comportamento",
                                suffixIcon: _controllerComportamento.text.isEmpty
                                    ? Container(width: 0)
                                    : IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      setState(() {
                                        _controllerComportamento.text = '';
                                      });
                                    }
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.90,
                                height: 50.0,
                                child: ElevatedButton(
                                    onPressed: _validarCampos,
                                    child: Text(
                                        "SALVAR"
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          Color(0xff478ca0)),
                                    )
                                )
                            )
                        )
                      ],
                    )
                )
            )
        )
    );
  }
}