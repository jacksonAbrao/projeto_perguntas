// ignore_for_file: deprecated_member_use, avoid_print, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import "./questao.dart";
import "./resposta.dart";

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
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

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()["respostas"]
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: <Widget>[
                  Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
                  ...respostas.map((t) => Resposta(t, _responder)).toList(),
                ],
              )
            : Center(
                child: Text(
                "Parabéns!",
                style: TextStyle(fontSize: 28),
              )),
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
