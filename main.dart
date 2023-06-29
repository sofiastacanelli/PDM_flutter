import 'package:flutter/material.dart';

void main() {
  runApp(QuestionnaireApp());
}

class QuestionnaireApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Questionnaire App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questionário'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sistema de Perguntas e Respostas',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              child: Text('Iniciar Questionário'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuestionnairePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionnairePage extends StatefulWidget {
  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  final List<Question> questions = [
    Question('Qual é o seu nome?'),
    Question('Qual é a sua idade?'),
    Question('Qual é a sua cidade?'),
  ];

  final Map<Question, String> userAnswers = {};

  int currentQuestionIndex = 0;
  final TextEditingController answerController = TextEditingController();

  void submitAnswer() {
    String answer = answerController.text.trim();
    userAnswers[questions[currentQuestionIndex]] = answer;
    answerController.clear();
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // Exibe as respostas do usuário
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Respostas do Usuário'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var entry in userAnswers.entries)
                  Text('${entry.key.question}: ${entry.value}'),
              ],
            ),
            actions: [
              ElevatedButton(
                child: Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questionário'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[currentQuestionIndex].question,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: answerController,
              onChanged: (value) {
                // Não é necessário chamar o submitAnswer aqui, pois vamos usar um botão para enviar a resposta
              },
            ),
            ElevatedButton(
              child: Text('Enviar Resposta'),
              onPressed: () {
                submitAnswer();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String question;

  Question(this.question);
}