// ignore_for_file: avoid_print, unrelated_type_equality_checks

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:projeto_app/Cadastro.dart';
import 'package:projeto_app/Padrao/PdMensagens.dart';
import 'package:projeto_app/model/Usuario.dart';
import './Login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
                child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Image.asset(
                      "images/logo.png",
                      width: 220.0,
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: SizedBox(
                    //width: MediaQuery.of(context).size.width * 0.92,
                    //height: 60.0,
                    child: TextField(
                      controller: controller.controllerEmail,
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        //filled: true,
                        //fillColor: Color(0xffecebea),
                        hintText: "E-mail",
                        errorText: (controller.controllerSenha.text == "")
                            ? null
                            : controller.mensagemErroEmail,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(() {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: SizedBox(
                      //width: MediaQuery.of(context).size.width * 0.92,
                      //height: 60.0,
                      child: TextField(
                        controller: controller.controllerSenha,
                        obscureText: !controller.visibilidadeSenha.value,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "Senha",
                          errorText: controller.controllerSenha.text == ""
                              ? null
                              : controller.mensagemErroSenha,
                          suffixIcon: IconButton(
                            icon: controller.visibilidadeSenha == false
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            onPressed: () {
                              controller.visibilidadeSenha.value =
                                  !controller.visibilidadeSenha.value;
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.92,
                    height: 60.0,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.loginUsuario(
                          Usuario(
                            nome: 'Jonny',
                            email: controller.controllerEmail.text,
                            senha: controller.controllerSenha.text,
                          ),
                        );
                      },
                      child: const Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff478ca0)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    child: Text(
                      "Esqueceu a senha?",
                      style: MsgAlertaPadrao(TamanhoFonte: 16.0),
                    ),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          print("google");
                        },
                        icon: const FaIcon(FontAwesomeIcons.google),
                        iconSize: 32,
                        color: Colors.indigo,
                      ),
                      IconButton(
                        onPressed: () {
                          print("facebook");
                        },
                        icon: const FaIcon(FontAwesomeIcons.facebook),
                        iconSize: 32,
                        color: Colors.indigo,
                      )
                    ],
                  ),
                ),
                const Divider(
                  height: 35,
                  color: Colors.grey,
                  indent: 20,
                  endIndent: 20,
                ),
                Center(
                  child: GestureDetector(
                    child: const Text("Cadastrar-se"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Cadastro()));
                    },
                  ),
                ),

                /* Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      _mensagemErro,
                      textAlign: TextAlign.center,
                      style: MsgErroPadrao(),
                    )
                  )
                )*/
              ],
            )),
          )),
    );
  }
}
