import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_app/Home.dart';
import 'package:projeto_app/Padrao/PdAppBar.dart';
import 'package:projeto_app/model/Usuario.dart';

class CadastroONG extends StatefulWidget {
  const CadastroONG({Key key}) : super(key: key);

  @override
  _CadastroONGState createState() => _CadastroONGState();
}

class _CadastroONGState extends State<CadastroONG> {

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  bool _visibilidadeSenha = false;
  String _mensagemErroEmail = "";
  String _mensagemErroSenha = "";

  _validarCampos(){

    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if( nome.isNotEmpty ){
      if( email.isNotEmpty && email.contains("@") ){
        if( senha.length > 6 ){
          setState(() {
            _mensagemErroEmail = "";
          });

          Usuario usuario = Usuario();
          usuario.nome = nome;
          usuario.email = email;
          usuario.senha = senha;

          _cadastrarUsuario( usuario );

        }else{
          setState(() {
            _mensagemErroSenha = "Senha Inválida! \nSua senha deve conter pelo menos 6 dígitos";
          });
        }
      }else{
        setState(() {
          _mensagemErroEmail = "Informe o E-mail";
        });
      }
    }else{
      setState(() {
        _mensagemErroEmail = "Informe o Nome";
      });
    }

  }

  _cadastrarUsuario( Usuario usuario ) async {

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.createUserWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha

    ).then(( FirebaseUser ){

      //Salvar dados do usuário
      FirebaseFirestore db = FirebaseFirestore.instance;

      db.collection("usuarios")
          .doc( FirebaseUser.user.uid )
          .set( usuario.toMap() );

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Home()
          )
      );

    }).catchError((error){

      setState(() {
        _mensagemErroEmail = "Dados inválidos. Tente novamente!";
      });

    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controllerEmail.addListener(() => setState(() {}));
    _controllerSenha.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPadrao('Cadastro - ONG'),
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
                        padding: EdgeInsets.only(bottom: 8),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.92,
                            height: 60.0,
                            child: TextField(
                                controller: _controllerNome,
                                autofocus: true,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                                    //filled: true,
                                    //fillColor: Color(0xffecebea),
                                    hintText: "Nome",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(32)
                                    )
                                )
                            )
                        )
                    ),

                    Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.92,
                            height: 60.0,
                            child: TextField(
                                controller: _controllerEmail,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                                    //filled: true,
                                    //fillColor: Color(0xffecebea),
                                    hintText: "E-mail",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(32)
                                    )
                                )
                            )
                        )
                    ),

                    Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.92,
                          height: 60.0,
                          child: TextField(
                              controller: _controllerSenha,
                              obscureText: !_visibilidadeSenha,
                              keyboardType: TextInputType.text,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                                  //filled: true,
                                  //fillColor: Color(0xffecebea),
                                  hintText: "Senha",
                                  suffixIcon: IconButton(
                                    icon: _visibilidadeSenha == false
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _visibilidadeSenha = !_visibilidadeSenha;
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32)
                                  )
                              )
                          ),
                        )
                    ),

                    Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.92,
                            height: 60.0,
                            child: ElevatedButton(
                                onPressed: _validarCampos,
                                child: Text(
                                  "Cadastrar ONG",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
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

                    Center(
                        child: Text(
                          _mensagemErroEmail,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20
                          ),
                        )
                    )

                  ],
                )
            ),
          )
      ),
    );
  }
}
