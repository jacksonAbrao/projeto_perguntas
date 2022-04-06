// ignore_for_file: deprecated_member_use, avoid_print, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import './questionario.dart';
import "./resultado.dart";

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      "texto": "Qual é a sua cor favorita?",
      "respostas": [
        {"texto": "Preto", "nota": 1},
        {"texto": "Verde", "nota": 2},
        {"texto": "Vermelho", "nota": 3},
        {"texto": "Blanco", "nota": 4},
      ],
    },
    {
      "texto": "Qual o seu animal favorito?",
      "respostas": [
        {"texto": "Capivara", "nota": 1},
        {"texto": "Cobra", "nota": 2},
        {"texto": "Cachorro", "nota": 3},
        {"texto": "Trige", "nota": 4},
      ],
    },
    {
      "texto": "Qual o seu instrutor favorito?",
      "respostas": [
        {"texto": "Maria", "nota": 1},
        {"texto": "João", "nota": 2},
        {"texto": "Leo", "nota": 3},
        {"texto": "Lusca", "nota": 4},
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Perguntas",
            textAlign: TextAlign.center,
          ),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
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
