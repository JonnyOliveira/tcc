import 'package:flutter/material.dart';
import 'package:projeto_app/CadastroTutor.dart';
import 'package:projeto_app/CadastroONG.dart';
import 'package:projeto_app/Padrao/PdAppBar.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPadrao('Cadastro'),
      body: Container(
          padding: EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
                child: Column(
                  children: [

                    Padding(
                        padding: EdgeInsets.only(bottom: 32),
                        child: Image.asset("images/logo.png")
                    ),

                    Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.92,
                            height: 60.0,
                            child: ElevatedButton(
                                child: Text(
                                  "Cadastrar Tutor",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => CadastroTutor())
                                  );
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xff478ca0)
                                    ),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                        )
                                    )
                                )
                            )
                        )
                    ),

                    Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.92,
                            height: 60.0,
                            child: ElevatedButton(
                                child: Text(
                                  "Cadastrar ONG",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => CadastroONG())
                                  );
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xff478ca0)
                                    ),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                        )
                                    )
                                )
                            )
                        )
                    ),

                  ],
                )
            ),
          )
      ),
    );
  }
}
