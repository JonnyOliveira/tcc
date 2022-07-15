import 'package:flutter/material.dart';
import 'package:projeto_app/CadastroConsulta.dart';
import 'package:projeto_app/HistoricoExame.dart';
import 'package:projeto_app/HistoricoPeso.dart';
import 'package:projeto_app/NovoDocumento.dart';
import 'package:projeto_app/NovoPeso.dart';

import 'Padrao/PdAppBar.dart';
import 'Padrao/PdDrawer.dart';
import 'Padrao/PdMensagens.dart';

class HistoricoConsulta extends StatefulWidget {
  const HistoricoConsulta({Key key}) : super(key: key);

  @override
  _HistoricoConsultaState createState() => _HistoricoConsultaState();
}

class _HistoricoConsultaState extends State<HistoricoConsulta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarPadrao('Histórico Consulta'),
      drawer: DrawerPadrao(),
      body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(builder: (context)=> HistoricoConsulta())
                                        );
                                      },
                                      child: Image.asset("images/medicamento.png")
                                  ),
                              ),
                              Center(
                                child: Text("Consultas"),
                              )
                            ],
                          ),

                          Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context)=> HistoricoPeso())
                                      );
                                    },
                                    child: Image.asset("images/medicamento.png")
                                ),
                              ),
                              Center(
                                child: Text("Controle de Peso"),
                              )
                            ],
                          ),

                          Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context)=> HistoricoExame())
                                      );
                                    },
                                    child: Image.asset("images/medicamento.png")
                                ),
                              ),
                              Text("Documentos"),
                            ],
                          ),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 30, bottom: 20),
                            child: Text(
                              "FLOKI",
                              textAlign: TextAlign.center,
                              style: MsgTituloDoisPadrao(),
                            ),
                          ),
                        ],
                      ),

                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("images/alimentacaoo.png"),
                        ),
                        title: Text("Consulta - Oftalmológica"),
                        subtitle: Text("20/02/2022 - 08:30h"),
                      ),

                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("images/alimentacaoo.png"),
                        ),
                        title: Text("Consulta - Ortopédica"),
                        subtitle: Text("01/12/2021 - 14:00h"),
                      ),

                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("images/alimentacaoo.png"),
                        ),
                        title: Text("Consulta - Geral"),
                        subtitle: Text("23/05/2021 - 16:30h"),
                      ),

                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("images/alimentacaoo.png"),
                        ),
                        title: Text("Consulta - Geral"),
                        subtitle: Text("02/06/2020 - 10:00h"),
                      ),

                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("images/alimentacaoo.png"),
                        ),
                        title: Text("Consulta - Fonoaudiológica"),
                        subtitle: Text("02/03/2020 - 10:00h"),
                      ),

                    ],
                  )
              )
          )
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NovaConsulta())
        );
      },
          child: const Icon(Icons.add),
          backgroundColor: Color(0xff478ca0)
      ),
    );
  }
}