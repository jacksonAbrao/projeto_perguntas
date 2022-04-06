// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 5) {
      return "Para, béns!!!";
    } else if (pontuacao < 10) {
      return "Brabo";
    } else {
      return "Jedí";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              fraseResultado,
              style: TextStyle(fontSize: 28),
            ),
          ),
          FlatButton(
            onPressed: quandoReiniciarQuestionario,
            child: Text(
              "Reiniciar?",
              style: TextStyle(fontSize: 18),
            ),
            textColor: Colors.blue,
          )
        ]);
  }
}
