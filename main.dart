import 'package:flutter/material.dart';

main(){
  runApp(aulaGrupo2());
}

class aulaGrupo2 extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Meu primeiro app!"),
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: () => {}, child: Text("Enviar")),
            ElevatedButton(onPressed: () => {}, child: Text("Cancelar")),
            ElevatedButton(onPressed: () => {}, child: Text("Salvar")),
            Column(
              children: [
                Text("Aprendendo"),
                Text("Programação"),
                Text("Flutter"),
              ],
            )
          ],
        ),
        ),
    );
  }
}