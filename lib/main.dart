// ignore_for_file: deprecated_member_use, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import "./questao.dart";

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });

    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      "Qual é a sua cor favorita?",
      "Qual o seu animal favorito?",
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]),
            RaisedButton(
              child: const Text("Resposta 1"),
              onPressed: _responder,
            ),
            RaisedButton(
              child: const Text("Resposta 2"),
              onPressed: _responder,
            ),
            RaisedButton(
              child: const Text("Resposta 3"),
              onPressed: _responder,
            )
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
