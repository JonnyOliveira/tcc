import 'package:flutter/material.dart';

AppBar AppBarPadrao(){
  return AppBar(
      title: Image.asset(
          "images/logo.png",
          width: 50, height: 50,
      ),
      centerTitle: true,
      backgroundColor: Color(0xff478ca0),
  );
}