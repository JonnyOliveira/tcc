import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Padrao/PdAppBar.dart';
import 'Padrao/PdDrawer.dart';

class OngComoAjudar extends StatefulWidget {
  const OngComoAjudar({Key key}) : super(key: key);

  @override
  State<OngComoAjudar> createState() => _OngComoAjudarState();
}

class _OngComoAjudarState extends State<OngComoAjudar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarPadrao('Como Ajudar'),
        drawer: DrawerPadrao(),
        body: SingleChildScrollView(
          child: Container(
            child: Center(
                child: Column(
                  children: [

                    Row(
                      children: [

                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Image.asset("images/logo.png")
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "ONG AMIGO BICHO",
                                style:
                                TextStyle(
                                    fontSize: 22,
                                    color: Color(0xff777777)
                                ),
                              ),
                            ),

                            Text(
                              "(42) 99999-9999",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff777777)
                              ),
                            )

                          ],
                        )
                      ],
                    ),

                    Row(
                       children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20, bottom: 20),
                              child: Text(
                                "Como Ajudar...",
                                textAlign: TextAlign.center,
                                style:
                                TextStyle(
                                    fontSize: 32,
                                    color: Color(0xff478ca0)
                                ),
                              ),
                            ),
                        ]
                    ),

                    Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20, bottom: 20),
                            child: Text(
                              "Bem vindo à ONG SOS AMIGO BICHO",
                              textAlign: TextAlign.center,
                              style:
                              TextStyle(
                                  fontSize: 22,
                                  color: Color(0xff777777)
                              ),
                            ),
                          ),
                        ]
                    )
                  ],
                )

            )
          )
        )
      //NÃO EXCLUIR O floatingActionButton, POIS ELE FICARÁ APENAS INVISÍVEL AO
      //USUÁRIO TUTOR. E FICARÁ VISÍVEL À ONG
      /*floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.edit),
          backgroundColor: Color(0xff478ca0)
      ),*/

    );
  }
}
