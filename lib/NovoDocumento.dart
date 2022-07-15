import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Padrao/PdAppBar.dart';
import 'Padrao/PdDrawer.dart';

class NovoDocumento extends StatefulWidget {
  const NovoDocumento({Key key}) : super(key: key);

  @override
  _NovoDocumentoState createState() => _NovoDocumentoState();
}

class _NovoDocumentoState extends State<NovoDocumento> {

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerDescricao = TextEditingController();
  TextEditingController _controllerData = TextEditingController();

  TextEditingController _controllerDocumento = TextEditingController();

  String _dropdownTipoDocumento = 'PDF';
  String _tipoDocumento = '';

  @override
  void initState() {
    super.initState();

    _controllerNome.addListener(() => setState(() {}));
    _controllerDocumento.addListener(() => setState(() {}));
    _controllerData.addListener(() => setState(() {}));
    _controllerDescricao.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarPadrao('Cadastro Documento'),
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
                                hintText: "Nome do Documento",
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
                                    borderRadius: BorderRadius.circular(26)
                                )
                            ),
                          ),
                        ),

                        /*
                        Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child:
                            Container(
                                width: MediaQuery.of(context).size.width * 0.90,
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26, width: 1),
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _dropdownTipoDocumento,
                                    borderRadius: BorderRadius.circular(26),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        _dropdownTipoDocumento = newValue;
                                        _tipoDocumento = newValue;
                                      });
                                    },
                                    items: <String>['PDF', 'Imagem']
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
                        */

                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: _controllerDocumento,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                                hintText: "Arquivo",
                                suffixIcon: _controllerDocumento.text.isEmpty
                                    ? Container(width: 0)
                                    : IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      setState(() {
                                        _controllerDocumento.text = '';
                                      });
                                    }
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(26)
                                )
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: _controllerData,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                                hintText: "Data",
                                suffixIcon: _controllerData.text.isEmpty
                                    ? Container(width: 0)
                                    : IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      setState(() {
                                        _controllerData.text = '';
                                      });
                                    }
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(26)
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
                                  _controllerData.text = DateFormat('d/MM/yyyy').format(date);
                                });
                              }
                            },
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: _controllerDescricao,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                                hintText: "Descrição",
                                suffixIcon: _controllerDescricao.text.isEmpty
                                    ? Container(width: 0)
                                    : IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      setState(() {
                                        _controllerDescricao.text = '';
                                      });
                                    }
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(26)
                                )
                            ),
                          ),
                        ),

                        Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.90,
                                height: 55.0,
                                child: ElevatedButton(
                                    onPressed: (){},
                                    child: Text(
                                        "SALVAR"
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          Color(0xff478ca0)),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(26),
                                            )
                                        )
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