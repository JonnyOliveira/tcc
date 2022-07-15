import 'package:flutter/material.dart';
import 'package:projeto_app/NovaRotina.dart';
import 'package:projeto_app/RotinaBanho.dart';
import 'package:projeto_app/RotinaMedicamento.dart';

import 'Padrao/PdAppBar.dart';
import 'Padrao/PdDrawer.dart';

class RotinaAlimentacao extends StatefulWidget {
  const RotinaAlimentacao({Key key}) : super(key: key);

  @override
  _RotinaAlimentacaoState createState() => _RotinaAlimentacaoState();
}

class _RotinaAlimentacaoState extends State<RotinaAlimentacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarPadrao('Rotina Alimentação'),
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
                                    MaterialPageRoute(builder: (context)=> RotinaAlimentacao())
                                );
                              },
                              child: Image.asset("images/alimentacaoo.png")
                          ),
                        ),
                        Center(
                          child: Text("Alimentação"),
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
                                    MaterialPageRoute(builder: (context)=> RotinaBanho())
                                );
                              },
                              child: Image.asset("images/banho.png")
                          ),
                        ),
                        Center(
                          child: Text("Banho e Tosa"),
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
                                    MaterialPageRoute(builder: (context)=> RotinaMedicamento())
                                );
                              },
                              child: Image.asset("images/medicamento.png")
                          ),
                        ),
                        Text("Medicação"),
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
                        style: TextStyle(fontSize: 28, color: Color(0xff777777)),
                      ),
                    ),
                  ],
                ),

                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("images/alimentacaoo.png"),
                  ),
                  title: Text("Alimentação - Diária"),
                  subtitle: Text("Ração - 08:00h - 27/04/22"),
                ),

                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("images/alimentacaoo.png"),
                  ),
                  title: Text("Alimentação - Diária"),
                  subtitle: Text("Arroz e Frango - 12:00h - 27/04/22"),
                ),

                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("images/alimentacaoo.png"),
                  ),
                  title: Text("Alimentação - Diária"),
                  subtitle: Text("Ração - 16:00h - 27/04/22"),
                ),

                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("images/alimentacaoo.png"),
                  ),
                  title: Text("Alimentação - Diária"),
                  subtitle: Text("Arroz e Frango - 20:00h - 27/04/22"),
                ),

              ],
            )
          )
        )
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NovaRotina())
            );
          },
        child: const Icon(Icons.add),
        backgroundColor: Color(0xff478ca0)
      ),
    );
  }
}
