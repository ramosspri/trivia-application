import 'package:flutter/material.dart';
import 'package:trivia_application/answer.dart';
import 'package:trivia_application/theme/app_theme.dart';
import 'package:bot_toast/bot_toast.dart';

import 'question.dart';

void main() => runApp(const TriviaApp());

class TriviaAppState extends State<TriviaApp> {
  var selectedQuestion = 0;

  void response() {
    final lastItem = selectedQuestion - 1;
    setState(() {
      if (selectedQuestion == lastItem) {
        BotToast.showText(text: 'Não existem mais perguntas');
      }
      selectedQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final questions = [
      'Qual sua cor favorita?',
      'Qual seu animal favorito?',
    ];

    final colorsAnswer = [
      'Amarelo',
      'Azul',
      'Vermelho',
    ];

    final animalsAnswer = [
      'Cachorro',
      'Gato',
      'Peixe',
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Trivia Application',
          ),
          backgroundColor: AppTheme.colors.lightPink,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Question(text: questions[selectedQuestion]),
              ),
              Answer(
                onPressed: response,
                text:
                    selectedQuestion == 0 ? colorsAnswer[0] : animalsAnswer[0],
              ),
              Answer(
                onPressed: response,
                text:
                    selectedQuestion == 0 ? colorsAnswer[1] : animalsAnswer[1],
              ),
              Answer(
                onPressed: response,
                text:
                    selectedQuestion == 0 ? colorsAnswer[2] : animalsAnswer[2],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TriviaApp extends StatefulWidget {
  const TriviaApp({super.key});

  @override
  TriviaAppState createState() {
    return TriviaAppState();
  }
}
