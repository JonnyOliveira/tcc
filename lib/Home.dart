import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_app/NovaRotina.dart';
import 'package:projeto_app/NovoPet.dart';
import 'package:projeto_app/PerfilPet.dart';

import 'Padrao/PdAppBar.dart';
import 'Padrao/PdDrawer.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarPadrao('Home'),
        drawer: DrawerPadrao(),
        body: SingleChildScrollView(
            child: Container(
                child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: [

                            Padding(
                                padding: EdgeInsets.all(32),
                                child: Image.asset("images/perfil_tutor.png")
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "Mary Doe",
                                    style:
                                        TextStyle(fontSize: 22, color: Color(0xff777777)),
                                  ),
                                ),

                                Text(
                                  "(42) 99999-9999",
                                  style: TextStyle(fontSize: 15, color: Color(0xff777777)),
                                )

                              ],
                            )
                          ],
                        ),

                      ],
                    )
                )
            )
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
          child: const Icon(Icons.edit),
          backgroundColor: Color(0xff478ca0)
        ),
    );
  }
}
