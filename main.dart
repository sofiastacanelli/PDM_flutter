import 'package:flutter/material.dart';
import './perguntas.dart';
import './botao.dart';

main(){
  runApp(aulaGrupo2());
}

class aulaGrupo2 extends StatefulWidget{

  @override
  State<aulaGrupo2> createState() => _aulaGrupo2State();
}

class _aulaGrupo2State extends State<aulaGrupo2> {  
  var contador = 0;

  final perguntas = [
    "Qual a sua cor favorita?",
    "Qual o seu animal favorito?",
    "Qual o seu carro favorito?",
    "Qual o seu signo favorito?",
    "Qual o seu cantor favorito?",
    "Qual o seu país favorito?",
    "Qual o seu ator favorito?",
  ];

  void clicou(){
    setState(() {
      contador : contador++;
    });
    print(contador);
  }

  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Jogo de perguntas"),
        ),
        body: Column(
          children: [
            Perguntas(perguntas[contador]),

            ElevatedButton(onPressed: clicou, child: Botao("Azul")),
            ElevatedButton(onPressed: clicou, child: Botao("Verde")),
            ElevatedButton(onPressed: clicou, child: Botao("Vermelho")),
            ElevatedButton(onPressed: clicou, child: Botao("Amarelo")),

          ],
        ),
        ),
    );
  }
}