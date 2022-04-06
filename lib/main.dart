// ignore_for_file: deprecated_member_use, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import "./questao.dart";
import "./resposta.dart";

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        "texto": "Qual é a sua cor favorita?",
        "respostas": ["Preto", "Verde", "Vermelho", "Blanco"],
      },
      {
        "texto": "Qual o seu animal favorito?",
        "respostas": ["Capivara", "Cobra", "Cachorro", "Trige"],
      },
      {
        "texto": "Qual o seu instrutor favorito?",
        "respostas": ["Maria", "João", "Leo", "Lusca"],
      },
    ];

    List<String> respostas =
        perguntas[_perguntaSelecionada].cast()["respostas"];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
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
