import 'package:flutter/material.dart';

TextStyle MsgErroPadrao({TamanhoFonte = 20.0}){
  return TextStyle(
      color: Colors.red,
      fontSize: TamanhoFonte,
      fontWeight: FontWeight.w800,
  );
}

TextStyle MsgAlertaPadrao({TamanhoFonte = 20.0}){
  return TextStyle(
      color: Colors.orange,
      fontSize: TamanhoFonte,
      fontWeight: FontWeight.w800
  );
}

TextStyle MsgTituloDoisPadrao({TamanhoFonte = 20.0}){
  return TextStyle(
      fontSize: 28,
      color: Color(0xff777777),
      fontWeight: FontWeight.w800,
  );
}