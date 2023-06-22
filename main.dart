import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() {
  runApp(AulaComponentes());
}

class AulaComponentes extends StatefulWidget{
  @override
  State<AulaComponentes> createState() => _AulaComponentesState();
}

class _AulaComponentesState extends State<AulaComponentes> {

  var perguntaAtual = 0;
  var cor = Colors.white;

  final List<Map<String, Object>> questionario = [
    {
      "pergunta": "Qual a sua cor favorita?",
      "respostas": ["Amarelo", "Preto", "Branco", "Azul", "Vermelho"]
    },
    {
      "pergunta": "Qual é seu animal favorito?",
      "respostas": ["Cachorro", "Gato", "Tartaruga", "Periquito"]
    },
    {
      "pergunta": "Qual sua linguagem favorita?",
      "respostas": ["Python", "Java", "JavaScript"]
    },
  ];

  bool get temPergunta {
    return perguntaAtual < questionario.length;
  }
  
  void acao() {
    setState(() {
      perguntaAtual++;
    });
    print(perguntaAtual);
  }

  Widget build(BuildContext context) {

    List<Widget> respostas = [];

    if (temPergunta) {
      for (var resposta in questionario[perguntaAtual]["respostas"] as List<String>) {
        respostas.add(
          Resposta(resposta, acao),
        );
      }
    }
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: temPergunta ? Questao(questionario[perguntaAtual]["pergunta"].toString()) : Questao("Terminou"),
        ),
        body: temPergunta ? Column(
          children: [
            ...respostas,
          ],
        ) : Text("Resultado"),
      ),
    );
  }
}