import 'package:flutter/material.dart';

import 'package:projeto_app/OngAnimaisAdocao.dart';
import 'OngComoAjudar.dart';

import 'Padrao/PdAppBar.dart';
import 'Padrao/PdDrawer.dart';

class OngsFavoritas extends StatefulWidget {
  const OngsFavoritas({Key key}) : super(key: key);

  @override
  State<OngsFavoritas> createState() => _OngsFavoritasState();
}

class _OngsFavoritasState extends State<OngsFavoritas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBarPadrao('ONGs favoritas'),
        drawer: DrawerPadrao(),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                      children: [

                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text(
                              "ONG - SOS AMIGO BICHO",
                              style:
                              TextStyle(fontSize: 22, color: Color(0xff777777)),
                            ),
                            subtitle: Text("(42)99999-9999"),

                            onTap: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 200,
                                    color: Colors.white,
                                    child: Center(

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[

                                          Text(
                                            "ONG - SOS AMIGO BICHO",
                                            style:
                                            TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff478ca0)
                                            ),
                                          ),

                                          //Text('ONG SOS AMIGO BICHO'),

                                          ListTile(
                                            leading: Icon(
                                              Icons.pets_sharp,
                                              color: Color(0xff478ca0),
                                            ),
                                            title: Text(
                                              "Animais para Adoção",
                                            ),
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: (context) => OngAnimaisAdocao())
                                              );
                                            },
                                          ),

                                          ListTile(
                                            leading: Icon(
                                              Icons.monetization_on_sharp,
                                              color: Color(0xff478ca0),
                                            ),
                                            title: Text(
                                              "Como Ajudar",
                                            ),
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: (context) => OngComoAjudar())
                                              );
                                            },
                                          )

                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          ),

                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text("Canil da Jocelina"),
                            subtitle: Text("(42)99999-9999"),
                          ),

                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text("ONG - Amigos Leais"),
                            subtitle: Text("(42)99999-9999"),
                          ),

                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text("ONG - São Francisco"),
                            subtitle: Text("(42)99999-9999"),
                        ),

                      ],
                  )
                )
            )
        )
    );
  }
}
