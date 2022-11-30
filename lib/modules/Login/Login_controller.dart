// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_app/model/Usuario.dart';

class LoginController extends GetxController {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();
  String senha = '';
  Rx<bool> visibilidadeSenha = false.obs;
  String mensagemErroEmail = "";
  String mensagemErroSenha = "";

  // _validarCampos(){

  //   String email = _controllerEmail.text;
  //   String senha = _controllerSenha.text;

  //   if( email.isNotEmpty && email.contains("@") ){
  //       if( senha.isNotEmpty ){
  //         setState(() {
  //           _mensagemErroEmail = "";
  //         });

  //         Usuario usuario = Usuario();
  //         usuario.email = email;
  //         usuario.senha = senha;

  //         _loginUsuario( usuario );

  //       }else{
  //         setState(() {
  //           _mensagemErroSenha = "Senha inválida! \nPor favor, tente novamente.";
  //         });
  //       }
  //   }else{
  //       setState(() {
  //         _mensagemErroEmail = "Endereço de E-mail não encontrado! \nPor favor, tente novamente.";
  //       });
  //   }
  // }

  loginUsuario(Usuario usuario) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .signInWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((FirebaseUser) {
      Get.toNamed('/login');
    }).catchError((error) {
      mensagemErroSenha = "Dados Inválidos! \nPor favor, tente novamente!";
    });
  }

  // Future _verificarUsuarioLogado() async{

  //   WidgetsFlutterBinding.ensureInitialized();
  //   await Firebase.initializeApp();
  //   FirebaseAuth auth = FirebaseAuth.instance;

  //   User usuarioLogado = await auth.currentUser;
  //   if(usuarioLogado != null){
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => Home()
  //         )
  //     );
  //   }
  // }

  // @override
  // void initState() {
  //   _verificarUsuarioLogado();
  //   _controllerEmail.addListener(() => setState(() {}));
  //   _controllerSenha.addListener(() => setState(() {}));
  // }
}
