import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  String _dropdownEspecie = 'Ave';
  String _dropdownPelagem = 'Curta';
  String _dropdownSexo = 'Fêmea';
  String _dropdownPorte = 'Mini';
  String _especie = '';
  String _pelagem = '';
  String _sexo = '';
  String _porte = '';

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
        appBar: AppBarPadrao(),
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
                                    onPressed: (){},
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