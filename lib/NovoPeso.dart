import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Padrao/PdAppBar.dart';
import 'Padrao/PdDrawer.dart';

class NovoPeso extends StatefulWidget {
  const NovoPeso({Key key}) : super(key: key);

  @override
  _NovoPesoState createState() => _NovoPesoState();
}

class _NovoPesoState extends State<NovoPeso> {

  TextEditingController _controllerPeso = TextEditingController();
  TextEditingController _controllerData = TextEditingController();
  TextEditingController _controllerObservacao = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controllerPeso.addListener(() => setState(() {}));
    _controllerData.addListener(() => setState(() {}));
    _controllerObservacao.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarPadrao('Cadastro Peso'),
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
                            controller: _controllerObservacao,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                                hintText: "Observação",
                                suffixIcon: _controllerObservacao.text.isEmpty
                                    ? Container(width: 0)
                                    : IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      setState(() {
                                        _controllerObservacao.text = '';
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